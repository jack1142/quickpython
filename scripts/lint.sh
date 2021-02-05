#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy --ignore-missing-imports quickpython/
poetry run isort --check --diff quickpython/ tests/
poetry run black --check quickpython/ tests/
poetry run flake8 quickpython/ tests/
poetry run safety check -i 39462
