#!/bin/bash
set -ax
TAG=3.11.3
PACKAGE=$1

USER=jmnote
IMAGE=alpine-$PACKAGE
REPO=$USER/$IMAGE

mkdir -p $IMAGE
cd $IMAGE

cat <<EOF > Dockerfile
FROM alpine:$TAG
RUN apk add --no-cache $PACKAGE
EOF

docker build -t $REPO:$TAG .
docker push $REPO:$TAG

docker tag $REPO:$TAG $REPO:latest
docker push $REPO:latest


