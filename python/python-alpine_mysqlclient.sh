set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM python:3.8.2-alpine3.11
RUN apk add --no-cache mariadb-connector-c-dev build-base \
&& pip install --no-cache mysqlclient \
&& apk del build-base
EOF

docker build -t jmnote/python:3.8.2-alpine3.11-mysqlclient .
docker push jmnote/python:3.8.2-alpine3.11-mysqlclient

