set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM python:3.8.2-slim-buster AS vendor
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"
RUN pip install --no-cache-dir slackclient

FROM python:3.8.2-alpine3.11
COPY --from=vendor /venv /venv
ENV PATH="/venv/bin:$PATH"
EOF

docker build -t jmnote/python:3.8.2-alpine3.11-slackclient .
docker push jmnote/python:3.8.2-alpine3.11-slackclient

