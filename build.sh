#!/bin/bash

# Variables
DOCKER_USERNAME="mohanasuriyan"
APP_NAME="react-app"
TAG="latest"

# Build Docker image
docker build -t $DOCKER_USERNAME/$APP_NAME:$TAG .

# Push to Docker Hub (dev repo)
docker push $DOCKER_USERNAME/$APP_NAME:$TAG

