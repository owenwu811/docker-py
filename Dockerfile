# syntax=docker/dockerfile:1

ARG PYTHON_VERSION=3.10

FROM python:${PYTHON_VERSION}
#Current Working Directory inside Docker Container being set to /src. Every command below is executed in this directory. 
WORKDIR /src
#copies requirements.txt from host to /src/requirements.txt inside of docker container filesystem - specifies dependencies for Python project
COPY requirements.txt /src/requirements.txt
#command executed in Docker Container
RUN pip install --no-cache-dir -r requirements.txt

COPY test-requirements.txt /src/test-requirements.txt
RUN pip install --no-cache-dir -r test-requirements.txt
#Copies entire host directory into src directory in Docker Container
COPY . .
ARG SETUPTOOLS_SCM_PRETEND_VERSION_DOCKER
#Install python inside of the Docker container
RUN pip install --no-cache-dir .
