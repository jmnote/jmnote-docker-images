set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/python:3.8.2-slim_git_supervisor_openssh-server

cat <<'EOF' > Dockerfile
FROM python:3.8.2-slim
RUN set -xe \
&& apt-get update -y \
&& apt-get install -y --no-install-recommends \
  git \
  supervisor \
  openssh-server \
&& rm -rf /var/lib/apt/lists/*
EOF

docker build -t $IMAGE . && docker push $IMAGE

