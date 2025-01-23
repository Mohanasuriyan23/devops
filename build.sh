#!/bin/bash

#Var
DOCKER_USERNAME="mohanasuriyan"
APP_NAME="react-app"
TAG="latest"

#build Docker image
docker build -t $DOCKER_USERNAME/$APP_NAME:$TAG .

#Push to Docker Hub (dev repo)
docker push $DOCKER_USERNAME/$APP_NAME:$TAG

