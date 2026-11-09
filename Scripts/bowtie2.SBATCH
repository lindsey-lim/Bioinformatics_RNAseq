#!/bin/bash
#SBATCH --job-name=bowtie2.SBATCH --output=z01.bowtie2-2
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#set environment, load module#
module load bowtie2/2.5.4

bowtie2 -x calb -1 WTA2_1PE -2 WTA2_2PE -S WTA2.sam

module unload bowtie2
