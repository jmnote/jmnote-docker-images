#!/bin/bash
set -ax
source tag.txt
PACKAGE=$1

USER=jmnote
IMAGE=python-$PACKAGE
REPO=$USER/$IMAGE

mkdir -p $IMAGE
cd $IMAGE

cat <<EOF > Dockerfile
FROM python:$TAG
RUN pip install --no-cache-dir $PACKAGE
EOF
