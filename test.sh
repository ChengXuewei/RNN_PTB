#!/bin/bash -l
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH --mem=50g
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gpus-per-task=1
#SBATCH --time=2-00:00:00 
#SBATCH --mail-type=ALL
#SBATCH --job-name="RNN"
# Activate Conda environment

date
module load miniconda3
/bigdata/statsdept/shared/xwcheng/envs/rnn


# 1- python main.py --cuda --bptt 5 --model RNN_RELU --emsize 100 --nhid 128 --dropout 0 --epochs 20 --nlayers 1 
# 2- python main.py --cuda --bptt 5 --model RNN_RELU --emsize 50 --nhid 64 --dropout 0 --epochs 20 --nlayers 1
# 3- python main.py --cuda --bptt 10 --model RNN_RELU --emsize 100 --nhid 128 --dropout 0 --epochs 20 --nlayers 1 
python main.py --cuda --bptt 40 --model RNN_RELU --emsize 100 --nhid 128 --dropout 0 --lr 0.1 --epochs 20 --nlayers 1 
# python main.py --cuda --bptt 30 --model RNN_TANH --emsize 50 --nhid 64 --dropout 0 --lr 0.1 --epochs 20 --nlayers 1 
# python main.py --cuda --bptt 12 --model RNN_TANH --emsize 256 --nhid 128 --dropout 0 --epochs 20 --nlayers 1 
# python main.py --cuda --bptt 30 --model RNN_RELU --emsize 50 --nhid 64 --dropout 0.5 --epochs 40
date
