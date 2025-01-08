FROM ubuntu:20.04

ARG APP_VERSION="1.0"
ARG APP_NAME="my-application-1"

# Install dependencies and python3-venv for virtual environment
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv

# Create a working directory
WORKDIR /app

# Copy dependency file
COPY src/requirements.txt requirements.txt

# Create a virtual environment and install dependencies
RUN python3 -m venv venv && \
    venv/bin/pip install --upgrade pip && \
    venv/bin/pip install -r requirements.txt

# Copy remaining files
COPY src/my-application-1.py ./

# Create the output and logs directories
RUN mkdir -p /app/output /app/logs

# Set the entry point with output redirection
ENTRYPOINT ["sh", "-c", "venv/bin/python my-application-1.py > /app/logs/logfile.trc 2>&1"]

