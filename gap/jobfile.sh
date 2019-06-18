#!/bin/bash

#SBATCH --time=72:00:00   # walltime
#SBATCH --ntasks=18   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem=192G   # total memory
#SBATCH -J "AgPd GAP"   # job name

#SBATCH --qos=msg
#SBATCH -C knl

# Set the max number of threads to use for programs using OpenMP. Should be <= ppn. Does nothing if the program doesn't use OpenMP.
export OMP_NUM_THREADS=$SLURM_CPUS_ON_NODE



# Get the path to the executable; should be on user's path after the modules have been loaded.
teach_sparse at_file=train.xyz \
  gap={ \
    distance_Nb \
    cutoff=6.0 \
    sparse_method=uniform \
    cutoff_transition_width=1.0 \
    delta=2.0 \
    theta_uniform=1.0 \
    n_sparse=25 \
    compact_clusters=True \
    order=2 \
    covariance_type=ARD_SE \
    add_species \
     \
    :soap \
    cutoff=4.5 \
    l_max=8 \
    sparse_method=cur_points \
    atom_sigma=0.5 \
    delta=0.2 \
    n_max=8 \
    cutoff_transition_width=0.5 \
    zeta=2 \
    n_sparse=500 \
    covariance_type=dot_product \
    add_species \
     \
     \
  } \
  sigma_parameter_name=csigma \
  hessian_parameter_name=ref_hessian \
  gp_file=mb.xml \
  force_parameter_name=vasp_force \
  energy_parameter_name=vasp_energy \
  virial_parameter_name=vasp_virial \
  config_type_parameter_name=config_type \
  default_sigma={0.001 0.001 0.02 0.1} \
  e0={Ag:-0.017808:Pd:-1.458358}
