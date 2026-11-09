#!/bin/bash
#SBATCH --job-name=trimmomatic_RNAseq.SBATCH --output=z01.RNAseq
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- set environment, load module -----------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#- variables-------------------------------------------------------------------#

adapters=/home/ll1273/RNAseq/TruSeq3-PE.fa

input_R1=/home/ll1273/RNAseq/WTA2_1.fq
input_R2=/home/ll1273/RNAseq/WTA2_2.fq

output_R1_PE=/home/ll1273/RNAseq/RNAseq_outputs/WTA2_1PE
output_R1_SE=/home/ll1273/RNAseq/RNAseq_outputs/WTA2_1SE

output_R2_PE=/home/ll1273/RNAseq/RNAseq_outputs/WTA2_2PE
output_R2_SE=/home/ll1273/RNAseq/RNAseq_outputs/WTA2_2SE

#- RUN command ----------------------------------------------------------------#

trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE \
$output_R1_SE \
$output_R2_PE \
$output_R2_SE \
SLIDINGWINDOW:4:15 \
HEADCROP:17 \
TRAILING:15 \
ILLUMINACLIP:$adapters:2:30:10 \
MINLEN:75

module unload trimmomatic
#- FIN -----------------------------------------------------------------------#


