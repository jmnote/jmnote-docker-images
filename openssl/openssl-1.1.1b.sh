set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl:1.1.1b

cat <<'EOF' > Dockerfile
FROM debian:10

## INSTALL
RUN set -x \
&& mkdir -p /tmp/openssl \
&& cd       /tmp/openssl \
&& apt-get update \
&& apt-get install -y curl cpanminus make gcc \
&& rm -rf /var/lib/apt/lists/* \
&& curl -LO https://www.openssl.org/source/openssl-1.1.1b.tar.gz \
&& tar xvzf openssl-1.1.1b.tar.gz \
&& cd openssl-1.1.1b/ \
&& ./config \
&& make && make install \
&& rm -rf /tmp/openssl

## TEST & TAR
RUN set -x \
&& cp /usr/local/lib/libssl.so.1.1    /usr/lib/x86_64-linux-gnu/libssl.so.1.1   \
&& cp /usr/local/lib/libcrypto.so.1.1 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 \
&& mkdir -p /tmp/openssl \
&& cd       /tmp/openssl \
&& openssl version | tee -a version.txt \
&& curl -V         | tee -a version.txt \
&& cp /usr/local/bin/openssl                     . \
&& cp /usr/lib/x86_64-linux-gnu/libssl.so.1.1    . \
&& cp /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 . \
&& cd /tmp/ \
&& tar cfvz openssl.tgz openssl/ \
&& rm -rf /tmp/openssl

EOF

docker build -t $IMAGE . && docker push $IMAGE
