#!/bin/bash
#===============================================================================
# File Name    : s04b_parseMergedVCF.sh
# Description  : This script will parse merged vcf files
# Usage        : sbatch s04b_parseMergedVCF.sh
# Author       : Kevin Blake, kevin.blake@wustl.edu modified from Alaric D'Souza
# Version      : 1.1
# Created      : Tue Jun  4 04:35:21 CDT 2019
# Modified     : Thu Oct  7 19:59:20 CDT 2021 
#===============================================================================
#Submission script for HTCF
#SBATCH --time=0-00:00:00 # days-hh:mm:ss
#SBATCH --job-name=parseMergedVCF
#SBATCH --cpus-per-task=1
#SBATCH --mem=50G
#SBATCH --output=slurm_out/snpsites/z_snpsites_%A_%a.out
#SBATCH --error=slurm_out/snpsites/z_snpsites_%A_%a.err
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

module load awd-scripts

#basedir if you want
basedir="$PWD"
indir="${basedir}/d04_snp_sites"
outdir="${basedir}/d04_snp_sites"
ID="postderep_ecoli54"

parseVCF_cluster.R ${indir}/${ID}_snp_sites.vcf ${outdir}/${ID}_snp_sites_parsed.txt
