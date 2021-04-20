set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl:1.1.1b-debian-10

cat <<'EOF' > Dockerfile
FROM debian:10

RUN set -x \
&& apt-get update && apt-get install -y curl cpanminus make gcc \
&& curl -LO https://www.openssl.org/source/openssl-1.1.1b.tar.gz \
&& tar xvzf openssl-1.1.1b.tar.gz \
&& cd openssl-1.1.1b/ \
&& ./config \
&& make && make install \
&& cp /usr/lib/x86_64-linux-gnu/libssl.so.1.1 /root/libssl.so.1.1----1.1.1d \
&& cp /usr/local/lib/libssl.so.1.1 /usr/lib/x86_64-linux-gnu/libssl.so.1.1 \
&& ldconfig
EOF

docker build -t $IMAGE . && docker push $IMAGE
