#!/bin/bash
#SBATCH --job-name=trimmomatic.SBATCH --output=z01.trimmomatic
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#- set environment, load module -----------------------------------------------#
shopt -s expand_aliases
module load trimmomatic

#- variables-------------------------------------------------------------------#

input_R1=/home/ll1273/trimmomatic_slurm_script/EC-12_R1_001.fastq
input_R2=/home/ll1273/trimmomatic_slurm_script/EC-12_R2_001.fastq

output_R1_PE=/home/ll1273/trimmomatic_slurm_script/EC-12_R1_paired.fq
output_R1_SE=/home/ll1273/trimmomatic_slurm_script/EC-12_R1_unpaired.fq

output_R2_PE=/home/ll1273/trimmomatic_slurm_script/EC-12_R2_paired.fq
output_R2_SE=/home/ll1273/trimmomatic_slurm_script/EC-12_R2_unpaired.fq

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
MINLEN:75

#- FIN -----------------------------------------------------------------------#
module unload trimmomatic
