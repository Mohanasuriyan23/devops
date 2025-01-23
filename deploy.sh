#!/bin/bash

# Variables
DOCKER_USERNAME="mohanasuriyan"
APP_NAME="react-app"
TAG="latest"

# Pull the latest image from Docker Hub
docker pull $DOCKER_USERNAME/$APP_NAME:$TAG

# Stop and remove any running container
docker stop $APP_NAME || true
docker rm $APP_NAME || true

# Run the container
docker run -d --name $APP_NAME -p 80:80 $DOCKER_USERNAME/$APP_NAME:$TAG

