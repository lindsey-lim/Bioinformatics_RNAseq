### Description of Experimental Design

This study works with *Candida albicans*, which is a commensal yeast that can cause a variety of pathologies, and researches how growth conditions affect gene expression and the metabolic responses to thiamine limited conditions. This study looks at the growth of *Candida albicans* under 2 treatments: grown in the presence of thiamine (Thi+) and grown in absence of thiamine (Thi-). There were three replicate samples under each treatment, and I will be looking at the WTA1 and WTA2 sample. 

### Cleaning

The original number of raw reads in the WTA1 forward read was 21098941 and in the WTA1 reverse read was 21098941. The original number of raw reads in the WTA2 forward read was 21972519 and in the WTA2 reverse read was 21972519. After running the FASTQC, the main things noted in the WTA1 forward and reverse was the Per base sequence content, Per sequence GC content, and Sequence Duplication levels. The main things noted in the WTA2 forward was Per base sequence content and Sequence Duplication Levels. The main things noted in the WTA2 reverse was the Per tile sequence quality, Per sequence GC content, and Sequence Duplication Levels. 

To clean the reads, I used this [script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/4480e4b229ef2ebed3e0fa842e05009ba0d211a9/Scripts/trimmomatic_RNAseq.SBATCH)

After cleaning the reads with trimmomatic, the number of raw reads in the WTA1 forward paired end was 20359567 and in the WTA1 reverse paired end was 20359567. The number of raw reads in the WTA2 forward paired end was 21188745 and in the WTA2 reverse paired end was 21188745. After running the FASTQC, the main things noted in the WTA1 forward was 
