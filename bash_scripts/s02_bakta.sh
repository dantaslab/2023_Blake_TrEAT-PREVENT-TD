#!/bin/bash
#===============================================================================
# File Name    : bakta.sh
# Description  : Annotation of assembled bacterial genomes, MAGs, and plasmids
# Usage        : sbatch bakta.sh
# Author       : Luke Diorio-Toth, ldiorio-toth@wustl.edu
# Version      : 1.0
# Modified     : Fri Oct 14 08:14:59 CDT 2022
# Created      : Fri Oct 14 08:14:59 CDT 2022
#===============================================================================
#Submission script for HTCF
#SBATCH --time=1-0:00:00 # days-hh:mm:ss
#SBATCH --job-name=bakta
#SBATCH --array=1-32
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --output=slurm_out/bakta/z_bakta_%a_%A.out
#SBATCH --error=slurm_out/bakta/z_bakta_%a_%A.out

eval $( spack load --sh py-bakta )

basedir="$PWD"
indir="${basedir}/d01_spades-assembly"
outdir="${basedir}/d02_bakta"
dbdir="/ref/gdlab/data/bakta_db/db"
mkdir -p ${outdir}
sample=`sed -n ${SLURM_ARRAY_TASK_ID}p ${basedir}/samplelists/ref_repeat.txt`

set -x
time bakta \
  --db ${dbdir} \
  --min-contig-length 200 \
  --prefix ${sample} \
  --output ${outdir}/${sample}.fasta \
  --threads ${SLURM_CPUS_PER_TASK} \
  --output ${outdir}/${sample} \
  ${indir}/${sample}.fasta
RC=$?
set +x

# Output if job was successful
if [ $RC -eq 0 ]
then
  echo "Job completed successfully"
else
  echo "Error occurred!"
  exit $RC
fi
