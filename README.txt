Scripts for Rosinger et al., 2020

Cakile_GBS_cluster_scripts:
Text file containing details of all the scripts and commands used in the cluster 
 -Demultiplex job
 -Clean up job
 -BWA and Nextgenmap aligner jobs as well as commands for aligner comparison
 -Picard job
 -Haplotype job
 -SNP filtering commands
 -Commands to detect fixed differences between the two species
 -Splitstree filtering
 -File preparation for fastStructure

GBS_fastq_Demultiplexer_v9_2Enyzme2barcode.pl & CP1aCP2.txt & CP3aCP4.txt:
-This script uses raw paired end fastq files and a list of barcodes of samples names to demultiplex them into individual samples files. It also removes barcodes. 

FQ_pair_np.pl:
-script used by the clean up job. This script reads through fastq files and checks that sequences are present in both read directions.

GBS_Cakile_R:
Text file containing the R script used for analysis and visualisation
-PCA and faststructure visualisation for the global thinned dataset
-PCA and faststructure visualisation for the C. edentula native range dataset
-Faststructure visualisation for the C. edentula global dataset
-PCA and faststructure visualisation for the C. maritima native range dataset
-selection of SNPs for Newhybrids
-HIest data preparation, analysis and visualisation
-Spearman correlation test
-Population statistic on global thinned dataset
