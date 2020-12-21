#!/bin/bash

#this script is used to show running jobs on stallo cluster.
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
