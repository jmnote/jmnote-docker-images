set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM python:3.8.2-slim-buster AS pip
RUN Flask gunicorn requests pycrypto
#RUN apt-get update
#RUN apt-get install -y --no-install-recommends build-essential gcc
#RUN pip install --user --no-warn-script-location beautifulsoup4 mysql-connector requests

FROM python:3.8.2-alpine3.11
COPY --from=pip /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
EOF

docker build -t jmnote/flaskgunicorn:v0.1.0 .
docker push jmnote/flaskgunicorn:v0.1.0
