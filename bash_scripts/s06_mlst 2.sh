#!/bin/bash
#===============================================================================
# File Name    : mlst.sh
# Description  : Scan many genomes against PubMLST typing schemes
# Usage        : sbatch mlst.sh
# Author       : Luke Diorio-Toth
# Version      : 1.1
# Created On   : Wed Oct 12 19:29:07 CDT 2022
# Last Modified: Wed Oct 12 19:29:07 CDT 2022
#===============================================================================
#
#Submission script for HTCF
#SBATCH --time=1-0:00:00 # days-hh:mm:ss
#SBATCH --job-name=mlst
#SBATCH --cpus-per-task=4
#SBATCH --mem=1G
#SBATCH --output=slurm_out/mlst/z_mlst_%A.out
#SBATCH --error=slurm_out/mlst/z_mlst_%A.out

eval $( spack load --sh mlst )

basedir="$PWD"
indir="${basedir}/d01_spades-assembly"
outdir="${basedir}/d05_mlst"
mkdir -p ${outdir}

set -x
time mlst --csv \
  --nopath \
  --threads ${SLURM_CPUS_PER_TASK} \
  ${indir}/*.fasta >> ${outdir}/mlst_results.csv
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
