#!/bin/bash

#this script is used to show running jobs on stallo cluster.
#Author Jun Zhang
#Date: 20190625
#copied from ~/bin/individual_qf (ECUST-CRE)
#Modified by ZHANG Jun, 20201002


cat << EOF
--------------------------------------------------------------------------------------------
==Path==
--------------------------------------------------------------------------------------------
EOF

echo $1
if [[ "x$1" == 'x-a' ]]
then
    for i in `squeue |awk '{print $1}'|sort -n|sed '/JOBID/d'`;do echo -n  "$i    ";scontrol show job $i |grep "WorkDir=/gpfs1/home/"| tr "=" " "|awk '{print $2}';done
else
    for i in `squeue -u $LOGNAME |awk '{print $1}'|sort -n|sed '/JOBID/d'`;do echo -n  "$i    ";scontrol show job $i |grep "WorkDir=/gpfs1/home/"| tr "=" " "|awk '{print $2}';done
fi

cat << EOF
--------------------------------------------------------------------------------------------
==Squeue==
--------------------------------------------------------------------------------------------
EOF

squeue -u $LOGNAME | sort -k1n

echo '--------------------------------------------------------------------------------------------'
let TOTAL_JOB=$(squeue -u $LOGNAME | awk '{print $5}' | wc -l)-1
let RUN_JOB=$(squeue -u $LOGNAME | awk '{print $5}' | grep -w R | wc -l)
echo "Total jobs  : $TOTAL_JOB"
echo Running jobs: $RUN_JOB
echo '--------------------------------------------------------------------------------------------'
