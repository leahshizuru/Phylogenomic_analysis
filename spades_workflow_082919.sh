#### De novo genome assembly (Trim Galore!, SPAdes, QUAST, BWA, NCBI, and Tablet) ####

# How does your data look post FastQC (or MultiQC) inspection? Did it pass most of the quality checks in the various modules given ezRAD parameters? 

# Trim Galore!: 

	if [ ! -d "trim_galore" ]; then
	mkdir trim_galore
	fi

# batch process PE fastq.gz files using Trim Galore!
# cd into directory where fastq.gz files are located
# files had the following naming scheme: sampleID_raw_F.fastq.gz , sampleID_raw_R.fastq.gz
# -j specifies the amount of cores that can be run simultaneously, however this option is currently unavailable. Script will proceed with single-core trimming.
# --illumina because we're interested in trimming off the first 13bp of the Illumina universal adapter AGATCGGAAGAGC
# --paired because we're working with PE data
# -o specifies files to which this script will target?
# brace expansion enables Trim Galore! to grab all files that are named _raw_F.fastq.gz and _raw_R.fastq.gz and apply the specified trimming parameters
# read messages generated during process because this will inform you on run parameters and where output files will be stored
# output files typically stored in ./trim_galore/ (trim_galore directory created in your current working directory)
	find -name "*_raw_F.fastq.gz" | cut -d "_" -f1 | parallel -j 30 trim_galore --illumina --paired --retain_unpaired --fastqc -o trim_galore/ {}\_raw_F.fastq.gz {}\_raw_R.fastq.gz
	

    find ./ -name "*.F.fq.gz" | cut -d "." -f2 | sed 's/\///' > popslis
# SPAdes:
# de novo asssembly using SPAdes genome assembler (for more details see: http://cab.spbu.ru/software/spades/)
# I opted not to set k-mer values
# --careful attempts to reduce mismatches and short indels
# -t is number of threads (default value is 16); this is will change with server. run `htop` to see current activity
# -m is the memory limit in Gb.
# -o specifies directory name to which output files will be stored (Each of my libraries are in /data/leah/spades/`sampleID`)
# -1 is input file of forward reads and -2 is input file of reverse reads (insert file name where backquote is and ignore backquotes)
# amalgamation of Evan's code and code presented here: https://bioinformatics.uconn.edu/bacterial-genome-assembly-tutorial/
	spades.py --careful -t 30 -m 300 -o /data/leah/spades/130 -1 `forward_trimmed_read` -2 `reverse_trimmed_read`


# I omitted k-mer tuning from my pipeline

# QUAST:

# make directory titled "quast" if one does not already exist
if [ ! -d "quast" ]; then
    mkdir quast
fi

KMER=(` find ./ -maxdepth 1 -name "K*" | cat  `)
ls K* -d | parallel -j 30 cp ./{}/final_contigs.fasta ./quast/{}.fasta
cd quast
quast.py -e -t 30 -m 300 ../contigs.fasta "${KMER[@]/%/.fasta}"
ls


# create "large_contigs.fasta" and BLAST in order to see how well the assembly worked. 
# if both Query Cover and Per. Ident are high and if they aligned to the same organism we can confidently say that the assembly worked
sed ':a;N;/^>/M!s/\n//;ta;P;D'  contigs.fasta > sed_corr.fasta
awk '/^>/ { getline seq } length(seq) >10000 { print $0 "\n" seq }' sed_corr.fasta > large_contigs.fasta


