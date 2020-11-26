#!/bin/bash
#SBATCH --time=90:55:00
#SBATCH --account=vhs
#SBATCH --job-name=lustre_4n_6t_6d_1000f_617m_25i
#SBATCH --nodes=4
#SBATCH --nodelist=comp02,comp03,comp04,comp06
#SBATCH --output=./results/exp_iterations_lustre/run-0/lustre_4n_6t_6d_1000f_617m_25i/slurm-%x-%j.out

source /home/vhs/Sea/.venv/bin/activate
    

srun -N4 ../scripts/clear_client_pc.sh
    
start=`date +%s.%N`
srun -N 1 bash ./results/exp_iterations_lustre/run-0/lustre_4n_6t_6d_1000f_617m_25i/n0_sea_parallel.sh &
srun -N 1 bash ./results/exp_iterations_lustre/run-0/lustre_4n_6t_6d_1000f_617m_25i/n1_sea_parallel.sh &
srun -N 1 bash ./results/exp_iterations_lustre/run-0/lustre_4n_6t_6d_1000f_617m_25i/n2_sea_parallel.sh &
srun -N 1 bash ./results/exp_iterations_lustre/run-0/lustre_4n_6t_6d_1000f_617m_25i/n3_sea_parallel.sh &
wait

end=`date +%s.%N`

runtime=$( echo "$end - $start" | bc -l )

echo "Runtime: $runtime"