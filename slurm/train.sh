#!/bin/bash
#SBATCH --job-name=ml_training
#SBATCH --output=logs/train_%j.out
#SBATCH --error=logs/train_%j.err
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --partition=gpu

# Load modules if needed
# module load python/3.11
# module load cuda/11.8

# Activate environment or use container
# source venv/bin/activate
# or
# apptainer exec container.sif python -m src.train

# Set environment variables
export WANDB_PROJECT="your-project-name"
export WANDB_MODE="online"  # or "offline" for debugging

# Run training script
python -m src.train \
    --config config/train_config.yaml \
    --wandb_project "$WANDB_PROJECT" \
    --wandb_entity "your-wandb-entity"
