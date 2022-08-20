# Python 3.10 official image
FROM python:3.10-slim-buster

# Receive POETRY_VERSION as a build ARG. Default to 1.1.13 (latest)
ARG POETRY_VERSION=1.1.13

# Set up environment variables
ENV LANG=C.UTF-8 \
    # Python:
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONHASHSEED=random \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    # Pip
    PIP_NO_CACHE_DIR=off \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    # Poetry
    POETRY_VERSION=${POETRY_VERSION}

# Set up base work directory
WORKDIR /app

# Install OS package dependencies
RUN apt-get update && \
    apt-get install -y libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/* && \
    # Install poetry
    pip install "poetry==$POETRY_VERSION"

# Copy files in the image
COPY . .

# Create Python virtual environment
RUN python -m venv /venv

# Export dependencies from Poetry and install them with pip
RUN poetry export --format requirements.txt --output requirements.txt && \
    /venv/bin/pip install -r requirements.txt && \
    rm requirements.txt

# So we can use the executables from the virtual environment
ENV PATH="/venv/bin:$PATH"

# Run as non-root user
RUN useradd -m nonrootuser
USER nonrootuser

# Start the main process.
CMD ["/bin/bash", "./run.sh"]
