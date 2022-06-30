# Alignment (Geneious 2022.1.1, MUSCLE/MUSCLE pluggin, Gblocks)

# Mitochondrial genome alignment for antipatharians (see Barrett et al. 2020; methods that follow reflect those of Shizuru et al. 2022 in review)

#GenBank
# download .fasta and .gff3 files from GenBank


#Geneious Prime 2022.1.1
# concatenate genes from each species (remove intronic regions that are present in COX1 and ND5). This is done by extracting coding regions and then selecting "Concatenate Sequences" from the Tools menu.
# perform MUSCLE alignment (with default parameters)

#Gblocks (to eliminate poorly aligned positions)(http://molevol.cmima.csic.es/castresana/Gblocks/Gblocks_documentation.html)

#Geneious Prime 2022.1.1 & Text editor
# upload .fasta file created by Gblocks and perform a pairwise alignment with annotated genome to obtain partitions needed for IQ-TREE
# create a partition.txt file. This file must follow RAxML style (see example: https://cme.h-its.org/exelixis/resource/download/hands-on/simpleDNApartition.txt)
# divide the positions you obtained above in Geneious by 3 and specify "codon" as the data type in the partition.txt file (for explanation see:https://groups.google.com/g/iqtree/c/0nemvQOaJNY )


