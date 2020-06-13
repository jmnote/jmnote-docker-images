set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

PYTHON_VERSION=3.8.3
IMAGE=jmnote/python:${PYTHON_VERSION}-alpine-selenium-chromium

cat <<EOF > Dockerfile
FROM python:${PYTHON_VERSION}-slim-buster AS pip
#RUN apt-get update
#RUN apt-get install -y --no-install-recommends build-essential gcc
RUN pip install --user --no-warn-script-location selenium

FROM python:${PYTHON_VERSION}-alpine
RUN apk add --update --no-cache chromium chromium-chromedriver
COPY --from=pip /root/.local /root/.local
ENV PATH=/root/.local/bin:\$PATH
EOF

cat Dockerfile
docker build -t $IMAGE . && docker push $IMAGE

