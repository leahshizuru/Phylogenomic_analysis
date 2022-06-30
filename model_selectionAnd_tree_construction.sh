# IQ-TREE (for model selection & tree construction)

# install Anaconda (alternatively you can install IQ-TREE mannually)

# Activate conda environment
# Install IQ-TREE via Anaconda 
conda activate
conda install -c bioconda iqtree

# Find best partition scheme followed by tree inference and ultrafast bootstrap

iqtree -s /Users/leahshizuru/data/Shizuru_et_al._alignment_Gblocks.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.txt -m MFP+MERGE -B 1000  