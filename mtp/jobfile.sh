#!/bin/bash

#SBATCH --time=72:00:00   # walltime
#SBATCH --ntasks=72   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem=192G   # total memory
#SBATCH -J "AgPd GAP"   # job name

#SBATCH --qos=msg
#SBATCH -C knl

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE

# Get the path to the executable; should be on user's path after the modules have been loaded.
mpirun -n 72 mlp.intel2017 train clean.pot train.cfg --max-iter=500 --trained-pot-name=hi.mtp --curr-pot-name=clean.pot --stress-weight=5e-4 --force-weight=5e-3
