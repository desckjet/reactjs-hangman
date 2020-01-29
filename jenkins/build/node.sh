#!/bin/bash

echo "**********************"
echo "* Building React app!*"
echo "**********************"

PROJ=/home/davidacevedo/jenkins/jenkins_home/workspace

docker run --rm -v $PROJ/$JOB_NAME:/app -w /app node "$@"