PYTHON := python3
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VENV_NAME := venv

all: list

.PHONY: install docs clean test

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

docs:
	echo "Building the documentation ..."
	$(PYTHON) -m mkdocs build
	echo "serving the documentation ..."
	$(PYTHON) -m mkdocs serve


clean:
	echo "Cleaning cache ..."
	$(PYTHON) -m tools.path_cleaner clear-all-cache
	@if [ -d "tests/.pytest_cache"]; then \
		rm -r tests/.pytest_cache; \
	fi


test:
	@echo "Running tests..."
	$(PYTHON) -m coverage run -m pytest tests/
	$(PYTHON) -m coverage report && \
	$(PYTHON) -m coverage json