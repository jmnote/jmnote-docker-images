#!/bin/bash
set -ax
source tag.txt
PACKAGE=$1

USER=jmnote
IMAGE=python-$PACKAGE
REPO=$USER/$IMAGE

cd $IMAGE

docker build -t $REPO:$TAG .
docker push $REPO:$TAG

docker tag $REPO:$TAG $REPO:latest
docker push $REPO:latest

