set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM python:3.8.2-alpine3.11
RUN pip install --no-cache-dir speedtest-cli
ENTRYPOINT ["/usr/local/bin/speedtest-cli"]
EOF

docker build -t jmnote/python:3.8.2-alpine3.11-speedtest-cli .
docker push jmnote/python:3.8.2-alpine3.11-speedtest-cli

