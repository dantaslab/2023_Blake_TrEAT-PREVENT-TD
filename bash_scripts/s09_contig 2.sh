#!/bin/bash                                                                                                                     

#Submission script for HTCF
#SBATCH --job-name=contigs
#SBATCH --array=1-105
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G
#SBATCH --output=slurm_out/contig/z_contig_%A_%a.out
#SBATCH --error=slurm_out/contig/z_contig_%A_%a.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu


basedir="$PWD"
indir="${basedir}/d02_bakta"
outdir="${basedir}/d09_easyfig"

sample=`sed -n ${SLURM_ARRAY_TASK_ID}p ${outdir}/mappingfiles/blaTEM_isolates.txt`
contig_blaTEM=`sed -n ${SLURM_ARRAY_TASK_ID}p ${outdir}/mappingfiles/blaTEM_contig.txt`
carrot_blaTEM=`sed -n ${SLURM_ARRAY_TASK_ID}p ${outdir}/mappingfiles/blaTEM_carrot.txt`

#Contig is n, carrot is n+1                                                                                                     
awk 'NR==n' RS=\> n=${carrot_blaTEM} ${indir}/${sample}/${sample}.fna > ${outdir}/extracted_contigs_blaTEM/${sample}_blaTEM_${contig_blaTEM}.fasta

#Remove last line (is empty)                                                                                                    
sed '$d' ${outdir}/extracted_contigs/${sample}_blaTEM_${contig_blaTEM}.fasta > ${outdir}/${sample}_blaTEM_${contig_blaTEM}_temp1.fasta

#Deletes last character in text file (new line symbol)                                                                          
head -c -1 ${outdir}/${sample}_blaTEM_${contig_blaTEM}_temp1.fasta > ${outdir}/${sample}_blaTEM_${contig_blaTEM}.fasta

#Remove intermediate file                                                                                                       
rm ${outdir}/${sample}_blaTEM_${contig_blaTEM}_temp1.fasta
