set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/php:7.4.4-apache_supervisor_openssh-server

cat <<'EOF' > Dockerfile
FROM php:7.4.4-apache
RUN set -xe \
&& apt-get update -y \
&& apt-get install -y --no-install-recommends \
  supervisor \
  openssh-server \
&& rm -rf /var/lib/apt/lists/*
EOF

docker build -t $IMAGE . && docker push $IMAGE
