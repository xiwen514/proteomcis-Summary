# proteomics-Summary

### upstream data anaysis
#### Maxquant
##### Website： https://www.maxquant.org/
##### Help： https://groups.google.com/g/maxquant-list
##### Maxquant's iBAQ vs. LFQ: Which to Use?
. When we utilize Maxquant for Label Free proteomics quantitative analysis, in the parameter settings of Maxquant, we encounter two parameters, LFQ and iBAQ. So, which one should we opt for?If you select both, in the final proteingroups.txt, three columns will appear: Intensity, IBAQ, and LFQ intensity. The numbers in these three columns, representing the quantification strength of the proteins, are different.
Firstly, let's look at the computational principles of these three: 
- Intensity sums up all the signal strengths of Unique and Razor peptides within a certain Protein Group, serving as an original intensity value.
- iBAQ divides this original intensity by the theoretical peptide count of the protein.
- LFQ adjusts the original intensity value across samples to eliminate errors between samples caused by processing, sample loading, pre-separation, instruments, etc.
. Let's assume there are two proteins, A and B, and their quantities in the sample are equal. If protein A consists of 10 peptides and B consists of 100, and given that both have a 30% coverage in identification results, protein A's intensity is 3, while B's is 30. Thus, B is ten times A, but originally, A and B are equal, indicating a significant discrepancy.
. Now, if we divide the original intensity by the number of theoretical peptides, the intensity of A becomes 3/10, and so does B. A = B, Perfect! This demonstrates the principle and usefulness of iBAQ.
. However, in quantitative proteomics, we don't compare protein A to protein B. Suppose you have a control sample of cells before and after drug treatment; we focus on the change in protein A before and after the treatment. The ratio between A and B isn't vital.
. Thus, for within-sample comparison, use iBAQ, as it represents the molar ratio (copy number) of the protein. For between-sample comparisons, opt for LFQ. 
. In conclusion:
For intra-sample protein comparisons (within the same or say, the same injection of sample), use IBAQ.
For inter-sample comparisons (whether replicates or different treatment groups), use LFQ.
(Note: Some technical terminologies might require specific context to be translated more accurately.)


##### files
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
