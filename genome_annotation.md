
# **Genome annotation** (software required: Mitos2 and Geneious Prime)

## **Geneious Prime**

Go to the "Annotate & Predict" tab and select "Find Repeats...". Locate repeats (specifically at the start and end of the linear sequence). Remove the repeated section and then circularize the sequence. Export the edited sequence as a .fasta file.

## **Mitos2**

Upload the .fast file generated above to Mitos2 (http://mitos2.bioinf.uni-leipzig.de/index.py) 
*If working with antipatharian select RefSeq 89 Metazoa and Genetic Code 4 (see Barrett et al. 2020)

## **Geneious Prime**

Final annotations for *Cirrhipathes* cf. *anguina* (Shizuru et al. 2022 in review) were carried out in Geneious Prime with the live annotate feature. 

> Create a folder in "Reference Features" containing the gff3 and .fasta files for species that were most similar (determined by previous BLAST search post assembly). The gff3 files will have the annotations, the .fasta files will contain only the sequence.
>
> Go to folder with the de novo assembly and double click the sequence to generate "Sequence View".
>
> Select "Allow Editing" tab and then select the "Annotate & Predict" tab. 
>
> Choose the "Annotate from Database" option. Geneious will automatically go into the folder that you created within "Reference Features".
>
> You can either choose "Best match" (in Find:) or "All matching annotations". For our paper we only applied "Best match" with "Similarity: 99%"
>
> Select "Apply" to transfer the annotations to your de novo assembly. Then type ⌘S (to save the file).
