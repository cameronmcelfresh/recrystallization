#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o $JOB_NAME_joblog.$JOB_ID
#$ -j y
# Edit the line below as needed
#$ -l h_rt=16:00:00,h_data=20G -pe shared 8 
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea

# NOTE YOU NEED TO SUBMIT THIS SCRIPT WITH:
# qsub -N NAMEOFYOURMPHFILEWITHNOEXTENSION submit_comsol_multithreaded.sh

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

# load the matlab job environment:
. /u/local/Modules/default/init/bash
module load comsol
module load matlab

matlab -nodisplay -r mainGrain_parametricStudy

#

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "

