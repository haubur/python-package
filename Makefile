PYTHON := python3
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PROJECT_NAME := src

all: list

.PHONY: build clean docs install test

build:
	@echo "Building python package ..."
	$(PYTHON) -m poetry build

clean:
	@echo "Cleaning tests ..."
	@if [ -d ".pytest_cache" ]; then \
		rm -r .pytest_cache;\
	fi
	@echo "Cleaning docs ..."
	@if [ -d "site/" ]; then \
		rm -r site/;\
	fi
	@echo "Cleaning coverage ..."
	@if [ -f ".coverage" ]; then\
		rm .coverage;\
	fi

docs:
	@echo "Building the documentation ..."
	$(PYTHON) -m poetry run mkdocs build
	@echo "serving the documentation ..."
	$(PYTHON) -m poetry run mkdocs serve

install:
	@echo "Installing package ..."
	$(PYTHON) -m poetry install --with dev,docs
	@echo "Installing pre-commit hooks ..."
	sudo apt-get install pre-commit
	$(PYTHON) -m poetry run pre-commit install --hook-type pre-commit

test:
	@echo "Running tests..."
	$(PYTHON) -m poetry run pytest --cov=$(PROJECT_NAME) tests/
