# IQ-TREE (for model selection & tree construction)

# install Anaconda (alternatively you can install IQ-TREE mannually)

# Activate conda environment
# Install IQ-TREE via Anaconda 
conda activate
conda install -c bioconda iqtree
  
#find the best partition scheme, reduce impact of overestimating branch support with UFBoot -bnni; determine best number of cores for run [iteration2].
iqtree -s /Users/leahshizuru/data/final_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.nex -m MFP+MERGE -B 1000 -bnni -T auto

#resample partitions and then sites within resampled partitions [iteration3]
iqtree -s /Users/leahshizuru/data/final_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.nex -m MFP+MERGE -B 1000 -bnni --sampling GENESITE -T auto

#iteration2 and iteration3 yielded the same phylogeny**

#Implement ModelFinder, tree search, SH-aLRT test and ultrafast bootstrap with 1000 replicates [iteration4]
iqtree -s /Users/leahshizuru/data/final_alignment.fasta -p /Users/leahshizuru/data/Shizuru_et_al._partitions.nex -m MFP+MERGE -B 1000 -alrt 1000 -bnni -T auto
