#!/bin/bash
#===============================================================================
# File Name    : s04c_pairwiseDistances.sh
# Description  : This script will parse merged vcf files
# Usage        : sbatch s04c_pairwiseDistances.sh
# Author       : Kevin Blake, kevin.blake@wustl.edu modified from Alaric D'Souza
# Version      : 1.1
# Created      : Tue Jun  4 04:35:21 CDT 2019
# Modified     : Thu Oct  7 19:59:20 CDT 2021 
#===============================================================================
#Submission script for HTCF
#SBATCH --time=0-00:00:00 # days-hh:mm:ss
#SBATCH --job-name=pairwiseDistances
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu 

module load awd-scripts

#basedir if you want
basedir="$PWD"
indir="${basedir}/d04_snp_sites"
outdir="${basedir}/d04_snp_sites"
ID="postderep_ecoli54"

calcSampleDist.py ${indir}/${ID}_snp_sites_parsed.txt ${outdir}/${ID}_pairwise_distances.txt
