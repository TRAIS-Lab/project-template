# Claude AI Assistant Configuration

This document provides context and guidelines for Claude AI assistants working on this machine learning project.

## Project Overview

This is a machine learning project template that includes:
- Modern Python dependency management with `uv`
- Containerization with Apptainer
- CI/CD with GitHub Actions (ruff formatting, pytest testing)
- Experiment management with Weights & Biases
- HPC job scheduling with Slurm
- Pre-commit hooks for code quality

## Project Structure

```
.
├── src/              # Main source code
├── tests/            # Unit tests
├── scripts/          # Utility scripts
├── slurm/            # Slurm job scripts
├── config/           # Configuration files (W&B, model configs)
├── data/             # Data directory (gitignored)
├── checkpoints/      # Model checkpoints (gitignored)
└── logs/             # Training logs (gitignored)
```

## Coding Standards

1. **Code Style**: Follow PEP 8, enforced by ruff with line length of 100
2. **Type Hints**: Use type hints for function signatures where applicable
3. **Documentation**: Include docstrings for all public functions and classes
4. **Testing**: Write unit tests for all modules using pytest
5. **Dependencies**: Add new dependencies to `pyproject.toml` and run `uv lock`

## Dependency Management

- Use `uv` for dependency management
- Add production dependencies to `[project.dependencies]` in `pyproject.toml`
- Add development dependencies to `[project.optional-dependencies.dev]`
- Always run `uv lock` after modifying dependencies
- Commit `uv.lock` file to ensure reproducible builds

## ML Best Practices

1. **Experiments**: Use Weights & Biases for experiment tracking
2. **Configuration**: Store configs in `config/` directory
3. **Data**: Keep data in `data/` (gitignored), document data sources
4. **Reproducibility**: Seed random number generators, log hyperparameters
5. **Versioning**: Tag important experiments and model checkpoints

## Container Usage

- Build container: `apptainer build image.sif Apptainer.def`
- Run experiments: `apptainer exec image.sif python -m src.train`
- Interactive shell: `apptainer shell image.sif`

## When Making Changes

1. Run `ruff format .` and `ruff check .` before committing
2. Ensure all tests pass with `pytest`
3. Update documentation if adding new features
4. Follow semantic versioning for releases
5. Keep commit messages clear and descriptive

## Common Tasks

- **Add a new dependency**: Update `pyproject.toml`, run `uv lock`
- **Run tests**: `uv run pytest`
- **Format code**: `uv run ruff format .`
- **Check code quality**: `uv run ruff check .`
- **Submit Slurm job**: `sbatch slurm/train.sh`
