#!/bin/bash
#SBATCH --job-name=trimmomatic.SBATCH --output=z01.trimmomaticHW4(1)
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- set environment, load module -----------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#- RUN command ----------------------------------------------------------------#

trimmomatic PE \
/home/ll1273/HW4_input_files/EC-12_R1_001.fastq.gz \
/home/ll1273/HW4_input_files/EC-12_R2_001.fastq.gz \
/home/ll1273/HW4_output_files/EC-12_R1_trmPE.fq.gz \
/home/ll1273/HW4_output_files/EC-12_R1_trmSE.fq.gz \
/home/ll1273/HW4_output_files/EC-12_R2_trmPE.fq.gz \
/home/ll1273/HW4_output_files/EC-12_R2_trmSE.fq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:/home/ll1273/HW4_input_files/TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

module unload trimmomatic
#- FIN -----------------------------------------------------------------------#
