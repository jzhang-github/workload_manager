# workload_manager
Scripts under this repository are used to show user's job queue

## Usage:
1. Determine the type of your workload manager.
2. Copy the file under your PATH. For example, ```/home/$LOGNAME/bin```
3. Run this command: ```chmod 755 /home/$LOGNAME/bin/showq*```
4. Run this command: ```source ~/.bashrc```
5. Run the code through your command line. For example: ```showq.slurm.sh```

#### Step 5 will print the following results.
```
--------------------------------------------------------------------------------------------
==Path==
--------------------------------------------------------------------------------------------
JobID 1                 Path of JobID1
JobID 2                 Path of JobID2
...

--------------------------------------------------------------------------------------------
==Squeue==
--------------------------------------------------------------------------------------------
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
...

--------------------------------------------------------------------------------------------
Total jobs  : 2
Running jobs: 2
--------------------------------------------------------------------------------------------
```
