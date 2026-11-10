### Description of Experimental Design

This study works with *Candida albicans*, which is a commensal yeast that can cause a variety of pathologies, and researches how growth conditions affect gene expression and the metabolic responses to thiamine limited conditions. This study looks at the growth of *Candida albicans* under 2 treatments: grown in the presence of thiamine (Thi+) and grown in absence of thiamine (Thi-). There were three replicate samples under each treatment, and I will be looking at the WTA1 and WTA2 sample. 

### Cleaning

The file name for the WTA1 forward is WTA1_1.fq, for the WTA1 reverse is WTA1_2.fq, for the WTA2 forward is WTA2_1.fq, and for the WTA2 reverse is WTA2_2.fq. The original number of raw reads in the WTA1 forward read was 21098941 and in the WTA1 reverse read was 21098941. The original number of raw reads in the WTA2 forward read was 21972519 and in the WTA2 reverse read was 21972519. After running the FASTQC, the main things noted in the WTA1 forward and reverse was the Per base sequence content, Per sequence GC content, and Sequence Duplication levels. The main things noted in the WTA2 forward was Per base sequence content and Sequence Duplication Levels. The main things noted in the WTA2 reverse was the Per tile sequence quality, Per sequence GC content, and Sequence Duplication Levels. 

To clean the reads, I used this [script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/4480e4b229ef2ebed3e0fa842e05009ba0d211a9/Scripts/trimmomatic_RNAseq.SBATCH)

After cleaning the reads with trimmomatic, the number of raw reads in the WTA1 forward paired end was 20359567 and in the WTA1 reverse paired end was 20359567. The number of raw reads in the WTA2 forward paired end was 21188745 and in the WTA2 reverse paired end was 21188745. After running the FASTQC, the main things noted in the WTA1 forward and reverse was the Per sequence GC content, Sequence Length Distribution, and Sequence Duplication Levels. The main things in the WTA2 forward and reverse was the Sequence Length Distribution and Sequence Duplication Levels. The names for the clean WTA1 forward file was WTA1_1PE, for the reverse is WTA1_2PE, for the clean WTA2 forward file was WTA2_1PE, and the clean WTA2 reverse was WTA2_2PE. 

### Alignment
I then built the index to align the clean reads onto. I built it using bowtie2-build GCF_000182965.3_ASM18296v3_genomic.fna calb. The [reference sequence](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/182/965/GCF_000182965.3_ASM18296v3/GCF_000182965.3_ASM18296v3_genomic.fna.gz) was found on NCBI.

I then aligned the WTA1 forward (WTA1_1PE) and reverse (WTA1_2PE) to this index using this [script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/0b784226607903fda1915f0785caadcb39f11142/Scripts/bowtie2.SBATCH). I named this file WTA1.sam. The concordant alignment rate (exactly one time) was 88.72%. After running the FASTQC, the main things noted were the Per Sequence GC Content, Sequence Length Distribution, and Sequence Duplication Levels.
<img width="886" height="643" alt="Screenshot 2026-11-09 at 7 42 00 PM" src="https://github.com/user-attachments/assets/8313bc30-03c7-4cce-ac35-295efa4a37a0" />
<img width="895" height="645" alt="Screenshot 2026-11-09 at 7 42 36 PM" src="https://github.com/user-attachments/assets/e6a0f56e-e882-4946-8ab2-ab09334e60a1" />
<img width="863" height="648" alt="Screenshot 2026-11-09 at 7 42 51 PM" src="https://github.com/user-attachments/assets/7136969f-84b9-46db-b1df-545bde0f4088" />

I then aligned the WTA2 forward (WTA2_1PE) and reverse (WTA2_2PE) to this index and named the file WTA2.sam. The concordant alignment rate (exactly one time) was 89.22%. After running the FASTQC, the main things noted were the Sequence Length Distribution and Sequence Duplication levels. 
<img width="893" height="648" alt="Screenshot 2026-11-09 at 7 43 37 PM" src="https://github.com/user-attachments/assets/73337b20-ca5c-4ee2-a7f2-2ebbf7b90f8c" />
<img width="870" height="649" alt="Screenshot 2026-11-09 at 7 43 49 PM" src="https://github.com/user-attachments/assets/f4646718-593f-4824-95fb-f1d85ae85c26" />

I then condensed the file into a bam file using samtools view -S -b WTA1.sam > WTA1.bam and then sorted it using samtools sort WTA1.bam -o WTA1.srt.bam. 

### HTseq
I set up the HTSeq conda environment using the following code:

$ module load anaconda3
$ conda create --name htseq
$ conda init
(restart shell by logging off HPC, log back on)
$ module load anaconda3
$ conda activate htseq
$ conda install -c bioconda htseq

I then wrote out the [HTseq SBATCH script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/0b784226607903fda1915f0785caadcb39f11142/Scripts/htseq.SBATCH) to analyze and process the data. The gtf file used in the script was found on NCBI through [this link](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/182/965/GCF_000182965.3_ASM18296v3/GCF_000182965.3_ASM18296v3_genomic.gtf.gz). 
