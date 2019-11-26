#!/bin/bash
rm -rf /tmp/jmnote-docker-images; mkdir /tmp/jmnote-docker-images; cd /tmp/jmnote-docker-images

git clone --depth=1 https://github.com/oracle/docker-images.git
cd docker-images/OracleWebLogic/dockerfiles/
. /buildDockerImage.sh -d

rm -rf /tmp/jmnote-docker-images
