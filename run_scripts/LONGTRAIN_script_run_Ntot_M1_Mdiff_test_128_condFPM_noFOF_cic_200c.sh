#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=24:00:00
#SBATCH --job-name=RUN_LONGTRAIN_Ntot_M1_Mdiff_test_128_condFPM_noFOF_cic_200c_nc8
#SBATCH -p gpu
#SBATCH -C a100-80gb,ib
#SBATCH --gpus=1
#SBATCH --output=/mnt/home/spandey/ceph/AR_NPE/run_scripts/slurm_logs/%x.%j.out
#SBATCH --error=/mnt/home/spandey/ceph/AR_NPE/run_scripts/slurm_logs/%x.%j.err

module load python
source /mnt/home/spandey/ceph/.venv/bin/activate

export OMP_NUM_THREADS=4

cd /mnt/home/spandey/ceph/AR_NPE/
time srun python /mnt/home/spandey/ceph/AR_NPE/notebooks/TEST_ROCKSTAR_RUNS/run_Ntot_M1_Mdiff.py LONGTRAIN_run_Ntot_M1_Mdiff_128_condFPM_noFOF_cic_200c_lgMmin1e13_Nmax6_nc8.yaml
echo "done"


