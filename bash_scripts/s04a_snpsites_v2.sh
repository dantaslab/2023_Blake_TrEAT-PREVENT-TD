#!/bin/sh

#!/bin/bash

#===============================================================================
# File Name    : s05a_snp_sites.sh
# Usage        : sbatch s18_snp_sites.sh
# Author       : Kevin S. Blake revised from Erin Newcomer and Skye Fishbein
# Version      : 1.0
# Created On   : 2021-01-17
# Last Modified: 2021-01-17
#===============================================================================
#
#Submission script for HTCF
#SBATCH --job-name=snp-sites
#SBATCH --mem=42G
#SBATCH -n 1
#SBATCH --array 1-17
#SBATCH --cpus-per-task=8
#SBATCH --output=slurm_out/snpsites/z_snpsites_%A_%a.out
#SBATCH --error=slurm_out/snpsites/z_snpsites_%A_%a.err 
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

module load snp-sites

basedir="$PWD"
indir="${basedir}/d03_core_genome"
outdir="${basedir}/d04_snp_sites"

ID=`sed -n ${SLURM_ARRAY_TASK_ID}p ${basedir}/samplelists/samplelist_subjects.txt`

echo "ID=$ID"
snp-sites -rv -o ${outdir}/${ID}_snp_sites.vcf ${indir}/${ID}/core_gene_alignment.aln
