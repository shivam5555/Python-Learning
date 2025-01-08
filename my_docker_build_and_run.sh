#!/bin/bash

APP_VERSION="1.0"
APP_NAME="my-application-1"

docker build -t ${APP_NAME}:${APP_VERSION} .

docker run -d \
  --name ${APP_NAME}-${APP_VERSION} \
  -v /home/dmitry/my_docker/my-application-1/output:/app/output \
  -v /home/dmitry/my_docker/my-application-1/logs:/app/logs \
  ${APP_NAME}:${APP_VERSION}

docker image ls ${APP_NAME}

docker ps --filter "name=${APP_NAME}_${APP_VERSION}"
