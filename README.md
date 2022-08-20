<div align="center">
  <img src="https://user-images.githubusercontent.com/58790635/174468703-115079f6-974d-43c7-8350-8621d71240e9.png" width="450"/>
</div>

<p align="center">
    <em>
        Python project template with a single configuration file that <b>orchestrates a <br> collection of pre-commit CI tools</b> that run locally without any extra installation required.
    </em>
</p>
<br>

____

`CI-mponhy` is based on [`pre-commit`](https://pre-commit.com/) and [`poetry`](https://python-poetry.org/). It runs multiple static analysis and formatters hooks before every commit so you can anticipate errors and type inconsistencies, ensuring good practices, readability and seamless integration. All hooks are configured to work with one another, and being called in such an order as to avoid overwriting each other fixes.

<br>

## Why CI-mphony?

#### ⌛️ No need for extra installations. <br> All hooks run based on online executables.

#### ⚙️ Just a single `pyproject.py` file for all your dependencies, <br> linters and formatters configuration. Yes, including [`flake8`](https://flake8.pycqa.org/en/latest/user/configuration.html#configuration-locations) :eyes:
#### :whale: Ready-to-use lightweight Docker image.

<br>

## Setup

Default values for `python` and `poetry` versions are `3.10` and `1.1.13` respectively. <br>
If you want to use different versions, this can be specified in the `.env` file:
```bash
POETRY_VERSION=1.1.13
PYTHON_VERSION=3.10
```

Install `poetry`
``` bash
make get-poetry
```

Build virtual environment and install dependencies
```bash
make build-venv
```

And you're all done! ✨

<br>

## Usage

`ci-mphony` connects the `pre-commit` hooks with `git` so they'll be run automatically whenever you make a new commit. **Commits won't be created untill all hooks have passed.**

<br>

Since `ci-mphony` doesn't install `pre-commit` in your system, if you want to run `pre-commit` on demand just use this command:
```bash
make pre-commit
```

<br>

## Hooks

- **[Built-in hooks](https://github.com/pre-commit/pre-commit-hooks)**
   - **Trailing whitespaces** <br>
    Trims trailing whitespaces

   - **End-of-line Fixer** <br>
    Ensures that a file is either empty or ends with one newline

   - **Requirements Fixer** <br>
    Sorts entries in requirements.txt file

- **[Sintax upgrade](https://github.com/asottile/pyupgrade)** <br>
Automatically upgrades syntax for newer versions of Python.

- **[Type Anotations](https://github.com/pre-commit/pygrep-hooks)** <br>
Enforces that Python 3.6+ type annotations are used instead of type comments.

- **[Type Hints Upgrade](https://github.com/sondrelg/pep585-upgrade)** <br>
Upgrades type hints to new types introduced in [PEP 585](https://peps.python.org/pep-0585/).

- **[MyPy](https://github.com/pre-commit/mirrors-mypy)** <br>
Runs MyPy static type checker.

- **[Absolute imports](https://github.com/MarcoGorelli/absolufy-imports)** <br>
Converts relative imports to absolute.

- **[Unsed imports](https://github.com/hadialqattan/pycln)** <br>
Finds and removes unused import statements with Pycln.

- **[iSort](https://github.com/pycqa/isort)** <br>
_iSort your imports, so you don't have to._

- **[Black](https://github.com/psf/black)** <br>
Runs Black: The uncompromising Python code formatter.

- **[Trailing Commas](https://github.com/asottile/add-trailing-comma)** <br>
Automatically adds trailing commas to calls and literals.

- **[Pylint](https://github.com/PyCQA/pylint)** <br>
Runs Pylint: checks for errors, enforces a coding standard, looks for code smells, and makes refactor suggestions.

- **[Flake8](https://github.com/PyCQA/flake8)** <br>
Runs Flake8: a command-line utility for enforcing style consistency across Python projects.

- **[Anti CRLF](https://github.com/Lucas-C/pre-commit-hooks)** <br>
   - **Removes CRLF** <br>
    Replaces CRLF end-lines with LF before committing.

   - **Forbid CRLF** <br>
    Forbids files containing CRLF end-lines to be committed

- **[Configuration Files Formatting](https://github.com/PyCQA/flake8)** <br>
   - **Format TOML** <br>
    Sets a standard for formatting TOML files.

   - **Format YAML** <br>
    Sets a standard for formatting YAML files.
 
