#!/bin/bash

source ./_repo_vars.sh
echo "Running project ${PROJECT_NAME}"

docker build .
