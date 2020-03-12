set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/octant:0.10.2-debian-slim

curl -o octant.deb -L https://github.com/vmware-tanzu/octant/releases/download/v0.10.2/octant_0.10.2_Linux-64bit.deb

cat <<'EOF' > Dockerfile
FROM debian:stable-slim
#RUN apt-get update && apt-install -y \
#apt-transport-https \
#ca-certificats \
#curl \
#&& rm -rf /var/lib/apt/lists/*
ADD octant.deb /tmp/
RUN dpkg -i /tmp/octant.deb
ENTRYPOINT ["octant"]
EOF

docker build -t $IMAGE . && docker push $IMAGE
