#!/bin/bash
#===============================================================================
# File Name    : amrfinder.sh
# Description  : Annotations ARGs and VFs in assembled genomes or contigs
# Usage        : sbatch amrfinder.sh
# Author       : Luke Diorio-Toth
# Version      : 1.3
# Created On   : Tue Oct 11 14:49:35 CDT 2022
# Last Modified: Tue Oct 11 14:49:35 CDT 2022
#===============================================================================
#Submission script for HTCF
#SBATCH --time=0-8:00:00 # days-hh:mm:ss
#SBATCH --job-name=amrfinder
#SBATCH --array=1-315
#SBATCH --cpus-per-task=4
#SBATCH --mem=500M
#SBATCH --output=slurm_out/amrfinder/z_amrfinder_%A_%a.out
#SBATCH --error=slurm_out/amrfinder/z_amrfinder_%A_%a.out

eval $( spack load --sh amrfinder@3.10.42 )

basedir="$PWD"
indir="${basedir}/d02_bakta"
outdir="${basedir}/d03_amrfinder-bakta_new"

# because there is inconsistent formatting to GFF files, specify the format
# options include prokka, bakta, pgap, etc. (see docs for the full list)
annotation_format="bakta"

#make output directory and read in the slurm array task
mkdir -p ${outdir}
sample=`sed -n ${SLURM_ARRAY_TASK_ID}p ${basedir}/samplelists/TrEAT-54_Cusco-189_ref-72_samplelist.txt`

set -x
time amrfinder --plus \
  -n ${indir}/${sample}/${sample}.fna \
  -p ${indir}/${sample}/${sample}.faa \
  -g ${indir}/${sample}/${sample}.gff3 \
  -a ${annotation_format} \
  --name ${sample} \
  -o ${outdir}/${sample}.tsv \
  --threads ${SLURM_CPUS_PER_TASK}
RC=$?
set +x

if [ $RC -eq 0 ]
then
  echo "Job completed successfully"
else
  echo "Error occurred in ${sample}!"
  exit $RC
fi
