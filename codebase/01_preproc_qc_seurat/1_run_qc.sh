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
module load Miniconda/3

# define variables
workdir="/gpfs/project/projects/MedRheuma/balmir/projects/p2_scrnaseq_natlas_ssc"

#go into execution folder and activate conda environment.
conda activate ${workdir}"/envs/02_seurat_general/"


## Log-File definieren
mkdir -p ${workdir}"/codebase/01_preproc_qc_seurat/logs"

export LOGFILE=${workdir}"/logs/"$PBS_JOBNAME"."$PBS_JOBID".log"

## write starting info in the log file
echo "START: `date`" >> $LOGFILE 
echo "`date +"%d.%m.%Y-%T"`" >> $LOGFILE 
#------------------------------------

echo >> $LOGFILE
echo "GLOBAL PARAMETERS..." >> $LOGFILE
echo "---------------------------" >> $LOGFILE
echo "JobID      : "$PBS_JOBID >> $LOGFILE
echo "Jobname    : "$PBS_JOBNAME >> $LOGFILE 
echo "WorkDir    : "$RUNDIR >> $LOGFILE 
echo "WorkNode   : "`hostname` >> $LOGFILE
echo "RunDir     : "$PBS_O_WORKDIR >> $LOGFILE
echo "# CPUs     : "$NCPUS >> $LOGFILE
echo "# Threads  : "$OMP_NUM_THREADS >> $LOGFILE

## to test
echo $PBS_NODEFILE >> $LOGFILE
echo $PBS_O_HOST >> $LOGFILE
echo $PBS_JOBID >> $LOGFILE
echo $PBS_QUEUE >> $LOGFILE
echo $( cat $PBS_NODEFILE | wc -l)
#-----------------------------------

## start writing to log file
echo >> $LOGFILE
echo "STARTING..." >> $LOGFILE
echo "---------------------------" >> $LOGFILE
#-----------------------------------


quarto render ${workdir}"/codebase/01_preproc_qc_seurat/1_preproc_qc_seurat_tests.qmd" -t html -o ${workdir}"/codebase/01_preproc_qc_seurat/1_preproc_qc_seurat_tests.qmd"_$(date +"%Y-%m-%d-%H%M")".html"

## write available info about the run in the log file
echo >> $LOGFILE 
echo "JOB STATS..." >> $LOGFILE
echo "--------------------------" >> $LOGFILE
qstat -f $PBS_JOBID >> $LOGFILE   
echo "--------------------------" >> $LOGFILE
echo >> $LOGFILE 
echo "END: `date`" >> $LOGFILE 
echo "`date +"%d.%m.%Y-%T"`" >> $LOGFIL
