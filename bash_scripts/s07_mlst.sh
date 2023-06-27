#!/bin/bash
#===============================================================================
# File Name    : s07_mlst.sh
# Description  : This script will run mlst in parallel
# Usage        : sbatch s07_mlst.sh
# Author       : Kevin Blake, kevin.blake@wustl.edu modified from Sanjam Sawhney
# Version      : 1.1
# Created      : Wed March  16 11:54:10 CDT 2020
# Modified     : Thu Oct  7 19:59:20 CDT 2021 
#===============================================================================
#Submission script for HTCF
#SBATCH --time=0-8:00:00 # days-hh:mm:ss
#SBATCH --job-name=mlst
#SBATCH --array=1-127
#SBATCH --mem=8G
#SBATCH --output=slurm_out/mlst/z_mlst_%a_%A.out
#SBATCH --error=slurm_out/mlst/z_mlst_%a_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

module load mlst

basedir="$PWD"
indir="${basedir}/d00_raw_assemblies"
outdir="${basedir}/d07_mlst_ecoli4"

mkdir -p ${outdir}

# Read in the slurm array task
sample=`sed -n ${SLURM_ARRAY_TASK_ID}p ${basedir}/samplelists/samplelist_ecoli55_wref72.txt`

#set -x

mlst --csv --scheme ecoli_4 ${indir}/${sample}.fasta > ${outdir}/${sample}_mlst.csv

#RC=$?
#set +x

#if [ $RC -eq 0 ]
#then
#  echo "Job completed successfully"
#else
#  echo "Error Occured in ${sample}!"
#  exit $RC
#fi
