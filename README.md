# proteomics-Summary

### upstream data anaysis
#### Maxquant
1.  mqpar.xml: generated from maxquant, which is only applicable for the analysis of one sample.
2.  01_xml_edit_script.sh:
if you have lots of samples for maxquant to run, you need to generate a new mqpar.xml. This script primarily edits XML files, adding all sample information to the final xml file.
3.  xml_test_final:
if you run the 01_xml_edit_script.sh script, you will get 42.xml! 1.xml is the mqpar.xml I generated from maxquant. YOu can tell the difference between these 2 xml files easily. 
4.  02_donet.sh:
Run maxquant!

#### nfcore

### downstream data analysis
1. PCA
2. differential expression analysis
3. WGCNA
4. functional enrichment analysis
