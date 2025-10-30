#!/bin/bash
#PBS -l select=1:ncpus=8:mem=220gb
#PBS -l walltime=23:59:58
#PBS -A "IMCdata"
#PBS -q HiMem
#PBS -M mire.balan@gmail.com 
#PBS -m abe
#PBS -N "p2_qc"
#---------------------------

#load necessary conda module
module load Miniconda/3_noInit
conda init bash
#Miniconda/2    Miniconda/3_snakemake


# define variables
workdir="/gpfs/project/projects/MedRheuma/balmir/projects/p2_scrnaseq_natlas_ssc"

#go into execution folder and activate conda environment.
conda activate ${workdir}"/envs/02_seurat_general/"

quarto render ${workdir}"/codebase/01_preproc_qc_seurat/1_preproc_qc_seurat_tests.qmd" -t html -o ${workdir}"/codebase/01_preproc_qc_seurat/1_preproc_qc_seurat_tests.qmd"_$(date +"%Y-%m-%d-%H%M")".html"
