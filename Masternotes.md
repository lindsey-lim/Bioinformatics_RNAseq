### Description of Experimental Design

This study investigates how thiamine availability affects gene expression and metabolic responses in *Candida albicans*, which is a commensal yeast that can cause a variety of pathologies. The experiment compares *C. albicans* grown under two conditions: Thi+ (growth in the presence of thiamine) and Thi- (growth in the absence of thiamine). Each treatment condition includes three biological replicate samples. For this analysis, I focused on the WTA1 and WTA2 samples. 

The bioinformatics workflow consisted of assessing raw sequencing read quality using FastQC, trimming reads with Trimmomatic, aligning the cleaned reads to a *C. albicans* reference genome using Bowtie2, and preparing the aligned reads for gene-level quantification using HTseq. 

### Raw Reads

The sequencing data consisted of paired-end reads, with separate FASTQ files containing the forward and reverse reads for each sample. For the WTA1 sample, the forward FASTQ file was WTA1_1.fq and the reverse FASTQ file was WTA1_2.fq. The number of original read pairs was 21098941. For the WTA2 sample, the forward FASTQ file was WTA2_1.fq, and the reverse FASTQ file was WTA2_2.fq. The number of original read pairs was 21972519. 

I used FASTQC to evaluate the quality of the raw sequencing reads before trimmming. I examined the quality-control reports for both the forward and reverse reads and identified modules that were flagged as potential concerns. For both the forward and reverse reads of the WTA1 sample, the main flagged modules were Per Base Sequence Content, Per Sequence GC Content, and Sequence Duplication Levels. 

WTA1 Forward: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 48 03 PM" src="https://github.com/user-attachments/assets/54d646bc-3377-4573-8ee3-8baaf32539a6" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 48 18 PM" src="https://github.com/user-attachments/assets/b1184867-56d8-409a-a68f-121d3bcba866" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 48 31 PM" src="https://github.com/user-attachments/assets/3ba81652-c027-49b4-ac91-b3d1e4227f3a" />

WTA1 Reverse: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 49 03 PM" src="https://github.com/user-attachments/assets/851aabf6-bf08-445d-8c55-a1d5ff6db8a2" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 49 15 PM" src="https://github.com/user-attachments/assets/4cb9ed25-f3de-4cfb-9c0b-a6d51dab5ab2" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 49 34 PM" src="https://github.com/user-attachments/assets/67906418-cb32-4cab-83aa-8c21f23ee19e" />

In the WTA2 sample, for the forward reads, the main flagged modules were Per Base Sequence Content and Sequence Duplication Levels. 

WTA2 Forward: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 50 15 PM" src="https://github.com/user-attachments/assets/93721bae-f0d6-4f32-adbb-96623176b8a4" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 50 28 PM" src="https://github.com/user-attachments/assets/ae3e0190-b96a-4954-a577-4f777ede8099" />

For the reverse reads, the main flagged modules were Per Tile Sequence Quality, Per Sequence GC Content, and Sequence Duplication Levels. 

WTA2 Reverse: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 50 49 PM" src="https://github.com/user-attachments/assets/c88c9184-bcba-4b88-85c0-69682cf6754c" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 51 07 PM" src="https://github.com/user-attachments/assets/f7494d66-b31d-49c6-8428-cee4eccf4f3d" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 51 18 PM" src="https://github.com/user-attachments/assets/c0f03740-0d2b-437c-aba0-54d321097174" />

### Cleaning
I used Trimmomatic to clean the paired-end sequencing reads before alignment. 

[Trimmomatic Script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/4480e4b229ef2ebed3e0fa842e05009ba0d211a9/Scripts/trimmomatic_RNAseq.SBATCH)

After trimming, I recorded the number of reads retained in the paired-end output files. In the WTA1 sample, there were 21098941 original read pairs and 20359567 paired-end reads were retained, leading to a 3.5% loss of reads. In the WTA2 sample, there were 21972519 original read pairs and 21188745 paired-ends were retained, leading to a 3.57% loss of reads. 

The cleaned paired-end files were named WTA1_1PE (WTA1 forward file), WTA1_2PE (WTA1 reverse file), WTA2_1PE (WTA2 forward file), and WTA2_2PE (WTA2 reverse file). 

I ran FastQC again on the cleaned reads to assess their quality after trimming. In the WTA1 sample forward and reverse reads, the main flagged modules were Per Sequence GC Content, Sequence Length Distribution, and Sequence Duplication Levels.

WTA1 Forward: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 55 43 PM" src="https://github.com/user-attachments/assets/3bcab82d-9ba5-44ee-88dd-05feca099597" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 55 55 PM" src="https://github.com/user-attachments/assets/925e1be4-7b65-401a-9f48-292544437f6a" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 56 06 PM" src="https://github.com/user-attachments/assets/8463b884-8a6a-4fc1-b530-ea52e1fe47b0" />

WTA1 Reverse: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 56 46 PM" src="https://github.com/user-attachments/assets/de9e4828-2a32-44aa-bfa7-e721ef4ed724" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 57 29 PM" src="https://github.com/user-attachments/assets/40066eab-e635-4e1d-a560-85d0c32c0522" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 57 42 PM" src="https://github.com/user-attachments/assets/1537ceb9-8ccb-4b63-9cd6-8be5f729d825" />

In the WTA2 sample forward and reverse reads, the main flagged modules were Sequence Length Distribution and Sequence Duplication Levels. 

WTA2 Forward: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 58 41 PM" src="https://github.com/user-attachments/assets/266b5fb2-c77e-4760-9f2b-7cf8deb04162" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 58 53 PM" src="https://github.com/user-attachments/assets/e346c107-ce94-4b06-9a20-5523efd20061" />

WTA2 Reverse: <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 59 10 PM" src="https://github.com/user-attachments/assets/0e968546-3a4a-4441-9791-76bdc3d81192" /> <img width="218" height="162" alt="Screenshot 2026-11-09 at 7 59 21 PM" src="https://github.com/user-attachments/assets/cf5ac529-7854-4de8-839b-16529ba685d1" />

### Alignment
To align the cleaned sequencing reads, I first downloaded a *Candida albicans* reference genome from NCBI. 

[Reference Genome](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/182/965/GCF_000182965.3_ASM18296v3/GCF_000182965.3_ASM18296v3_genomic.fna.gz)

I then build a Bowtie2 index using the following command: bowtie2-build GCF_000182965.3_ASM18296v3_genomic.fna calb

This command generated the Bowtie2 index files with the prefix calb, which were used for read alignment. 

I aligned the cleaned forward and reverse reads from each sample to the indexed *C. albicans* reference genome using Bowtie2. 

[Bowtie2 Script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/0b784226607903fda1915f0785caadcb39f11142/Scripts/bowtie2.SBATCH)

For the WTA1 alignment, the input files were WTA1_1PE (forward) and WTA1_2PE (reverse). The output file was WTA1.sam. The percentage of read pairs that aligned concordantly exactly one time was 88.72%. For the WTA2 alignment, the input files were WTA2_1PE (forward) and WTA2_2PE (reverse). The output file was WTA2.sam. The percentage of read pairs that aligned concordantly exactly one time was 89.22%. 

WTA1.sam FastQC Flagged Modules:

<img width="218" height="162" alt="Screenshot 2026-11-09 at 7 42 00 PM" src="https://github.com/user-attachments/assets/8313bc30-03c7-4cce-ac35-295efa4a37a0" />
<img width="218" height="162" alt="Screenshot 2026-11-09 at 7 42 36 PM" src="https://github.com/user-attachments/assets/e6a0f56e-e882-4946-8ab2-ab09334e60a1" />
<img width="218" height="162" alt="Screenshot 2026-11-09 at 7 42 51 PM" src="https://github.com/user-attachments/assets/7136969f-84b9-46db-b1df-545bde0f4088" />

WTA2.sam FastQC Flagged Modules:

<img width="218" height="162" alt="Screenshot 2026-11-09 at 7 43 37 PM" src="https://github.com/user-attachments/assets/73337b20-ca5c-4ee2-a7f2-2ebbf7b90f8c" />
<img width="218" height="162" alt="Screenshot 2026-11-09 at 7 43 49 PM" src="https://github.com/user-attachments/assets/f4646718-593f-4824-95fb-f1d85ae85c26" />

After alignment, I converted the SAM files into BAM format using SAMtools. BAM files contain the same alignment as SAM files but in a compressed binary format. 

For WTA1, I used: samtools view -S -b WTA1.sam > WTA1.bam
I then sorted the BAM file using samtools sort WTA1.bam -o WTA1.srt.bam. 

For WTA2, I used: samtools view -S -b WTA2.sam > WTA2.bam
I then sorted the BAM file using samtools sort WTA2.bam -o WTA2.srt.bam. 

Sorting organizes the alignments by genomic position, making the files easier to process in subsequent analyses. 

### HTseq
To prepare for gene-level read counting, I created a Conda environment and installed HTSeq on the HPC system.

I used the following commands: 

module load anaconda3
conda create --name htseq
conda init

After logging out and back into the HPC system, I ran:

module load anaconda3
conda activate htseq
conda install -c bioconda htseq

This environment allowed me to run HTSeq independently of the other software environments used earlier in the workflow. 

I then wrote out the [SBATCH script](https://github.com/lindsey-lim/Bioinformatics_RNAseq/blob/0b784226607903fda1915f0785caadcb39f11142/Scripts/htseq.SBATCH) to run HTSeq on the aligned sequencing data. HTSeq is used to count sequencing reads that overlap annotated genomic features, such as genes. These counts can subsequently be used to compare gene expression across samples.

For this analysis, I obtained a gene annotation file in GTF format from NCBI. 

[Annotation File](https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/182/965/GCF_000182965.3_ASM18296v3/GCF_000182965.3_ASM18296v3_genomic.gtf.gz). 
