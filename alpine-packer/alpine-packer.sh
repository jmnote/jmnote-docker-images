#!/bin/bash
set -ax
TAG=$1
PACKAGE=$2

OS=alpine
MAINTAINER=jmnote

TEMPDIR=/tmp/dockerdir-$OS-$PACKAGE
REPO=$MAINTAINER/$OS-$PACKAGE

mkdir -p $TEMPDIR
pushd $TEMPDIR
echo "FROM $OS:$TAG
RUN apk add --no-cache $PACKAGE" > Dockerfile
docker build -t $REPO:$TAG .
docker push $REPO:$TAG
popd
rm -rf $TEMPDIR

