# python-package

A modern python package template with professional grade best practices.

## Components

### Development

1. Dependency Management
This package uses poetry for dependency management.
**[tool.poetry.dependencies]** is the implicit main group of dependencies.
Other dependencies required for specific usage are addressed in poetry's [group dependency management](https://python-poetry.org/docs/managing-dependencies/) functionality,
i.e. **[tool.poetry.group.test.dependencies]** and **[tool.poetry.group.docs.dependencies]**.

2. Documentation
Using **MkDocs** the project requires a **mkdocs.yml** file to configure the documentation, i.e. the layout using the nav attribute.
The documentation is written in .md files and placed in a dedicated **/docs** folder. All docstrings within the code are added to the documentation leveraging **mkdocstrings**.
Note, that Ruff is set to check for [google's docstring conventions](https://google.github.io/styleguide/pyguide.html#38-comments-and-docstrings).

3. Linting and Formating
Performed with Rust based **Ruff**. Corresponding settings are defined in pyproject.toml.

4. Static Typing

5. pre-commit-hooks
Using general hooks and Ruff hooks.


### Deployment

1. Changelog
While there are tools to automatically generate changelogs, it will remain a manual process to outline the essential changes.
This avoids cluttering the user with irrelvant and surely hard to understand commit and merge request messages.

## List of all tools
- [MkDocs](https://www.mkdocs.org/user-guide/)
- [Poetry](https://python-poetry.org/docs/)
- [Ruff](https://docs.astral.sh/ruff/)
