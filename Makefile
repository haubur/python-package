PYTHON := python3
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VENV_NAME := venv

all: list

.PHONY: build clean docs install test

build:
	echo "Building python package ..."
	$(PYTHON) -m poetry build

clean:
	echo "Cleaning cache ..."
	$(PYTHON) -m tools.path_cleaner clear-all-cache
	@if [ -d "tests/.pytest_cache"]; then \
		rm -r tests/.pytest_cache; \
	fi

docs:
	echo "Building the documentation ..."
	$(PYTHON) -m mkdocs build
	echo "serving the documentation ..."
	$(PYTHON) -m mkdocs serve

install:
	@if [ ! -d "$(VENV_NAME)" ]; then \
		echo "Creating virtual environment..."; \
		$(PYTHON) -m venv $(VENV_NAME); \
		echo "Activating virtual environment..."; \
		. $(VENV_NAME)/bin/activate && \
		pip install --upgrade pip && \
		pip install -r requirements.txt; \
	else \
		. $(VENV_NAME)/bin/activate && \
		pip install --upgrade pip && \
		pip install -r requirements.txt; \
	fi
	pre-commit install --hook-type pre-commit

test:
	@echo "Running tests..."
	$(PYTHON) -m coverage run -m pytest tests/
	$(PYTHON) -m coverage report && \
	$(PYTHON) -m coverage json

linting:
	@echo "Running linting ..."
	$(PYTHON) -m pylint --rcfile=pyproject.toml src/

typing:
	@echo "Type checking ..."
	$(PYTHON) -m mypy --config-file=pyproject.toml src/

style:
	@echo "Auto-checking code style ..."
	$(PYTHON) -m isort src/
	$(PYTHON) -m black src/
	$(PYTHON) -m autoflake --config=pyproject.toml --recursive src/
