set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

BASE=debian:10.6-slim
cat <<EOF > Dockerfile
FROM $BASE
RUN apt-get update && apt-get -y install \
  cron \
&& rm -rf /var/lib/apt/lists/*
EOF

docker build -t jmnote/$BASE-cron .
docker push jmnote/$BASE-cron

