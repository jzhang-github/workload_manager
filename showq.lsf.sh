#!/bin/bash
#This script is used to show selected details of all the jobs.
#Date: 20200726
#Author: Jun Zhang
#Email: 18326675997@163.com

#get the path: bjobs -l | grep -A3 'Submitted from host' | tr '\n' ' ' | sed s/[[:space:]]//g | sed "s/CWD</\n/g" | awk -F'>,' '{print $1}'
#get the job ID: bjobs -l | grep 'Job <' | awk '{print $2}'
echo ============================================================
busers
echo ============================================================
bjobs | awk '{print $1,$3}' | grep -v ^12 > .JOB_ID_tmp
echo JOB PATH > .JOB_PATH_tmp
bjobs -l | grep -A3 'Submitted from host' | tr '\n' ' ' | sed s/[[:space:]]//g | sed "s/CWD</\n/g" | awk -F'>,' '{print $1}' | sed '1d' >> .JOB_PATH_tmp
paste .JOB_ID_tmp .JOB_PATH_tmp
rm .JOB_ID_tmp .JOB_PATH_tmp
