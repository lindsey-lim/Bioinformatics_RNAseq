#!/bin/bash
#SBATCH --job-name=trimmomatic.SBATCH --output=z01.trimmomaticHW4(2)
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- set environment, load module -----------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#- variables-------------------------------------------------------------------#

adapters=/home/ll1273/HW4_input_files/TruSeq3-PE.fa

input_R1=/home/ll1273/HW4_input_files/EC-12_R1_001.fastq.gz
input_R2=/home/ll1273/HW4_input_files/EC-12_R2_001.fastq.gz

output_R1_PE=/home/ll1273/HW4_output_files/EC-12_R1_trmPE.fq.gz
output_R1_SE=/home/ll1273/HW4_output_files/EC-12_R1_trmSE.fq.gz

output_R2_PE=/home/ll1273/HW4_output_files/EC-12_R2_trmPE.fq.gz
output_R2_SE=/home/ll1273/HW4_output_files/EC-12_R2_trmSE.fq.gz

#- RUN command ----------------------------------------------------------------#

trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE \
$output_R1_SE \
$output_R2_PE \
$output_R2_SE \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:$adapters:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

module unload trimmomatic
#- FIN -----------------------------------------------------------------------#
