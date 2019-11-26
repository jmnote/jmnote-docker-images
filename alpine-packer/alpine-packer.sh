#!/bin/bash
set -ax
TAG=$1
PACKAGE=$2

TEMPDIR=/tmp/dockerdir-alpine-$PACKAGE
REPO=jmnote/alpine-$PACKAGE

mkdir -p $TEMPDIR
pushd $TEMPDIR
echo "FROM alpine:$TAG
RUN apk add --no-cache $PACKAGE" > Dockerfile
docker build -t $REPO:$TAG .
docker push $REPO:$TAG
popd
rm -rf $TEMPDIR

