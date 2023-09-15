
# View tree and modify branch labels (software required: FigTree & Inkscape)

## FigTree v1.4.4
  
1. Open .treefile created by IQ-TREE
2. Pop-up window asking what to label branches of tree will appear. Type in "SH-aLRT value/ultrafast bootstrap value" and press "OK".
3. In "Trees" (on sidebar) select "Root tree", "User Selection", check "Order nodes" and order by decreasing
4. In "Branch Labels" (on sidebar) change display to "SH-aLRT value/ultrafast bootstrap value"
  
  *In Shizuru et al. 2022 (in review) I opted to "Align Tip Labels" and opted to select "Node Shapes"
  
5. Change species names in phylogeny (IQ-TREE will automatically assingn "_" to a space) by selecting "Taxa" in "Selection Mode" category. Go to "Annotate" and write the name as you'd like it to appear in print. Note, italicizing will be made possible in the next step via Inkscape.
6. Go to "File" and "Export.svg"
  
## Inkscape 1.2

1. Open Inkscape and select "Load"
2. Select .svg file that you saved from FigTree
3. Right click on the image and select "Ungroup". Do this multiple times until each component of the tree can be edited.
4. Modify canvas space: File -> Document Properties.
5. Use selector tool to group objects
6. Export as .png (https://www.google.com/search?q=export+document+in+inkscape&rlz=1C5CHFA_enUS996US997&oq=export+document+in+inkscape&aqs=chrome..69i57j0i546l2.12579j0j7&sourceid=chrome&ie=UTF-8#kpvalbx=_aJ8DZYSEHbLBkPIPwpq6qAs_31)
  
  >... Now you've got a figure that's publication worthy!
