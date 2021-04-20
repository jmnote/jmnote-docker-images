set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl:1.1.1b-debian-10

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
&& make && make install

## TEST
RUN set -x \
&& cp /usr/local/lib/libssl.so.1.1    /usr/lib/x86_64-linux-gnu/libssl.so.1.1   \
&& cp /usr/local/lib/libcrypto.so.1.1 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 \
&& openssl version | tee -a /root/version.txt \
&& curl -V         | tee -a /root/version.txt


## TAR
RUN set -x \
&& cd /root/ \
&& cp /usr/local/bin/openssl                     . \
&& cp /usr/lib/x86_64-linux-gnu/libssl.so.1.1    . \
&& cp /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 . \
&& tar cfvz openssl.tgz ./

EOF

docker build -t $IMAGE . && docker push $IMAGE
