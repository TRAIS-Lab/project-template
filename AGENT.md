# AI Agent Configuration

This document provides context for AI coding assistants working on this project.

## Project Type

Machine Learning Research/Development Project

## Technology Stack

- **Language**: Python 3.11+
- **Package Manager**: uv
- **Testing**: pytest with coverage
- **Linting/Formatting**: ruff
- **Container**: Apptainer
- **Experiment Tracking**: Weights & Biases
- **Job Scheduler**: Slurm

## Key Files

- `pyproject.toml`: Project configuration and dependencies
- `Apptainer.def`: Container definition
- `.pre-commit-config.yaml`: Pre-commit hooks configuration
- `.github/workflows/`: CI/CD pipelines

## Development Workflow

1. Create feature branch from `main`
2. Make changes, ensuring code passes ruff checks
3. Write/update tests
4. Run `pytest` to verify tests pass
5. Commit with pre-commit hooks enabled
6. Push and create pull request
7. CI will run format checks and tests automatically

## Important Guidelines

- Always use type hints when appropriate
- Write docstrings for public APIs
- Keep functions focused and small
- Follow the existing code structure in `src/`
- Update tests when modifying functionality
- Check for linting errors before committing

## Experiment Workflow

1. Configure experiment in `config/wandb_config.yaml`
2. Create or modify Slurm script in `slurm/`
3. Submit job: `sbatch slurm/train.sh`
4. Monitor via W&B dashboard
5. Review results and iterate

## Code Organization

- Keep data processing logic separate from training code
- Use configuration files for hyperparameters
- Implement model classes in `src/models/`
- Put training scripts in `src/train.py` or `scripts/`
- Utility functions in `src/utils/`
