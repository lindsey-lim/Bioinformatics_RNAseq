### Description of Experimental Design

This study works with *Candida albicans*, which is a commensal yeast that can cause a variety of pathologies, and researches how growth conditions affect gene expression and the metabolic responses to thiamine limited conditions. This study looks at the growth of *Candida albicans* under 2 treatments: grown in the presence of thiamine (Thi+) and grown in absence of thiamine (Thi-). There were three replicate samples under each treatment, and I will be looking at the WTA1 and WTA2 sample. 

##Cleaning

The original number of raw reads in the WTA1 forward read was 21098941 and in the WTA1 reverse read was 21098941. The original number of raw reads in the WTA2 forward read was 21972519 and in the WTA2 reverse read was 21972519. After running the FASTQC, the main things to fix were the per base sequence content, sequence duplication levels, and per sequence GC content.

To clean the reads, I used the following trimmomatic commands:
SLIDINGWINDOW:4:15 \
HEADCROP:17 \
TRAILING:15 \
ILLUMINACLIP:$adapters:2:30:10 \
MINLEN:75

After cleaning the reads with trimmomatic, the number of raw reads in the WTA1 forward paired end was 20359567 and in the WTA1 reverse paired end was 20359567. The number of raw reads in the WTA2 forward paired end was 21188745 and in the WTA2 reverse paired end was 21188745. After running the FASTQC, the main things to fix were 
