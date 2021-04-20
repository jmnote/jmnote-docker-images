set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl-test

cat <<'EOF' > Dockerfile
FROM debian:10

RUN set -x \

RUN set -x \
&& apt-get update && apt-get install -y curl cpanminus make gcc \
&& curl -LO https://www.openssl.org/source/openssl-1.1.1b.tar.gz \
&& tar xvzf openssl-1.1.1b.tar.gz \
&& cd openssl-1.1.1b/ \
&& ./config \
&& make && make install
EOF

docker build -t $IMAGE . && docker push $IMAGE
