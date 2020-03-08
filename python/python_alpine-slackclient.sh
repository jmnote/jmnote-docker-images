set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM python:3.8.2-slim-buster AS vendor
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc
RUN pip install --user --no-cache-dir --no-warn-script-location slackclient

FROM python:3.8.2-alpine3.11
COPY --from=vendor /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
EOF

docker build -t jmnote/python:3.8.2-alpine3.11-slackclient .
docker push jmnote/python:3.8.2-alpine3.11-slackclient

