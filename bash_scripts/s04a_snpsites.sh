#!/bin/sh
#!/bin/bash
#===============================================================================
# File Name    : s04a_snp_sites.sh
# Usage        : sbatch s04a_snp_sites.sh
# Author       : Kevin Blake, kevin.blake@wustl.edu modified from Erin Newcomer and Skye Fishbein
# Version      : 1.1
# Created      : 2021-01-17
# Modified     : Thu Oct  7 19:59:20 CDT 2021 
#===============================================================================
#Submission script for HTCF
#SBATCH --job-name=snp-sites
#SBATCH --mem=42G
#SBATCH -n 1
#SBATCH --cpus-per-task=8
#SBATCH --output=slurm_out/snpsites/z_snpsites_%A_%a.out
#SBATCH --error=slurm_out/snpsites/z_snpsites_%A_%a.err
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

module load snp-sites

basedir="$PWD"
indir="${basedir}/d03_core_genome"
outdir="${basedir}/d04_snp_sites"
ID="postderep_ecoli54"

mkdir -p ${outdir}

snp-sites -rv -o ${outdir}/${ID}_snp_sites.vcf ${indir}/${ID}/core_gene_alignment.aln
