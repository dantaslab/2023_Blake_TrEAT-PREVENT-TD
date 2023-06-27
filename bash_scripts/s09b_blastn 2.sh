#!/bin/bash
#===============================================================================
# File Name    : s07_blast.sh
# Description  : This script performs an all vs all blast
# Usage        : sbatch s07_blast.sh
# Author       : Luke Diorio-Toth, ldiorio-toth@wustl.edu
# Version      : 1.1
# Created On   : Tue Jul  7 21:45:13 CDT 2020
# Modified On  : Tue Jul  7 21:45:13 CDT 2020
#===============================================================================
#Submission script for HTCF
#SBATCH --time=1-00:00:00 # days-hh:mm:ss
#SBATCH --job-name=blast
#SBATCH --cpus-per-task=12
#SBATCH --mem=30G
#SBATCH --output=slurm_out/blast/z_blast_%A.out
#SBATCH --error=slurm_out/blast/z_blast_%A.out

eval $( spack load --sh /u7ssbm4xx34vdq2plabbqvwaoehfsyw3 )

basedir="$PWD"
indir="${basedir}/d09_easyfig"
outdir="${basedir}/d09b_easyfig_out"

mkdir -p ${outdir}

# cat together all extracted DNA chunks into a single file
echo "Combining all seqs..."
cat ${indir}/extracted_contigs_blaTEM_TrEAT/*.fasta > ${outdir}/allseqs.fna

echo "Running blastn..."
set -x
time blastn -query ${outdir}/allseqs.fna \
        -subject ${outdir}/allseqs.fna \
        -perc_identity 95 \
        -num_threads ${SLURM_CPUS_PER_TASK} \
        -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend qlen sstart send slen evalue" \
        | tee -a ${outdir}/blast_out.tsv
RC=$?
set +x

if [ $RC -eq 0 ]
then
  echo "Job completed successfully"
else
  echo "Error Occured!"
  exit $RC
fi
