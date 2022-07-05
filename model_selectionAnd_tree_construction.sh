# IQ-TREE (for model selection & tree construction)

# install Anaconda for downstream analyses (alternatively you can install IQ-TREE mannually)

# Activate conda environment
# Install IQ-TREE via Anaconda 
conda activate
conda install -c bioconda iqtree

# Find best partition scheme followed by tree inference and ultrafast bootstrap

iqtree -s /Users/leahshizuru/data/Shizuru_et_al._Gblocks_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.txt -m MFP+MERGE -B 1000  

# reduce impact of overestimating branch support with UFBoot -bnni
iqtree -s /Users/leahshizuru/data/Shizuru_et_al._Gblocks_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.txt -m MFP+MERGE -B 1000 -bnni