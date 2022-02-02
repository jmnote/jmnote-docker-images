set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/mydumper:2022-02-03
echo IMAGE=$IMAGE

cat <<EOF > Dockerfile
FROM ubuntu:focal
RUN set -x \
&& apt-get update -y \
&& apt-get install -y libglib2.0-dev mydumper \
&& rm -rf /var/lib/apt/lists/*
EOF

docker build -t $IMAGE . && \
docker push     $IMAGE

