#!/bin/bash

# Trim Galore!: 

	if [ ! -d "trim_galore" ]; then
	mkdir trim_galore
	fi

# cd into directory where fastq.gz files are located and run the following to batch process pair-end reads
# files had the following naming scheme: "sampleID_raw_F.fastq.gz" and "sampleID_raw_R.fastq.gz"
# brace expansion enables Trim Galore! to grab all files that are named _raw_F.fastq.gz and _raw_R.fastq.gz and apply the specified trimming parameters
	
	find -name "*_raw_F.fastq.gz" | cut -d "_" -f1 | parallel trim_galore --illumina --paired --retain_unpaired --fastqc -o trim_galore/ {}\_raw_F.fastq.gz {}\_raw_R.fastq.gz
	
  	find ./ -name "*.F.fq.gz" | cut -d "." -f2 | sed 's/\///' > popslist

# SPAdes (utilize most recent release; older versions have bugs)

	spades.py --careful -t 30 -m 300 -o /data/leah/spades/`sampleID` -1 `forward_trimmed_read` -2 `reverse_trimmed_read`

# QUAST:

	if [ ! -d "quast" ]; then 
	mkdir quast
	fi

	KMER=(` find ./ -maxdepth 1 -name "K*" | cat  `)
	ls K* -d | parallel -j 30 cp ./{}/final_contigs.fasta ./quast/{}.fasta
	cd quast
	quast.py -e -t 30 -m 300 ../contigs.fasta "${KMER[@]/%/.fasta}"

# create "large_contigs.fasta" 

	sed ':a;N;/^>/M!s/\n//;ta;P;D'  contigs.fasta > sed_corr.fasta
	awk '/^>/ { getline seq } length(seq) >10000 { print $0 "\n" seq }' sed_corr.fasta > large_contigs.fasta

# BLAST large_contigs.fasta as a secondary check for assembly success

