#!/bin/bash
#SBATCH --job-name=htseq.SBATCH --output=z01.htseq
#SBATCH --mail-type=END,FAIL --mail-user=ll1273@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#-set environment, load module#
source activate htseq

#-set variables#
htseq=/home/ll1273/.conda/envs/htseq/bin/htseq-count
bam=/home/ll1273/RNAseq/RNAseq_cleaned/WTA1.srt.bam
gtf=/home/ll1273/RNAseq/RNAseq_cleaned/GCF_000182965.3_ASM18296v3_genomic.gtf

#-RUN htseq-count#
$htseq -f bam -r pos -s no -t exon -i gene_id $bam $gtf > WTA1_htseqCount

#-FIN, deactivate environment#
conda deactivate
