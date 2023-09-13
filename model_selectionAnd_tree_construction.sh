#!/bin/bash

# Model selection & tree construction (software required: Anaconda, IQ-TREE 2.2.0)

# install Anaconda (alternatively you can install IQ-TREE mannually)

# Activate conda environment
# Install IQ-TREE via Anaconda if installed skip this step
conda activate
conda install -c bioconda iqtree

#Implement ModelFinder, tree search, SH-aLRT test and ultrafast bootstrap with 1000 replicates [run2]
iqtree -s /Users/leahshizuru/data/final_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.nex -m MFP+MERGE -B 1000 -alrt 1000 -bnni -T auto


