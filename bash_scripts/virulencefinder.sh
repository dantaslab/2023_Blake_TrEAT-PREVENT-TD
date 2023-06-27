#!/bin/bash 

basedir="$PWD"
indir="d01_spades-assembly"
outdir="d02_virulence"
blastdir="/usr/local/ncbi/blast/bin/blastn"
virfinder_db="${basedir}/virulencefinder_db/"

mkdir -p ${outdir}

for f in ${indir}/*.fasta; do

mkdir -p ${outdir}/"$f"

./virulencefinder/virulencefinder.py -i "$f" -o ${outdir}/"$f" -p ${virfinder_db} -mp ${blastdir} -x -q

done