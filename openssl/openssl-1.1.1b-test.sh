set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl:1.1.1b

cat <<'EOF' > Dockerfile
FROM debian:10

RUN set -x \
&& apt-get update && apt-get install -y openssl curl \
&& rm -rf /var/lib/apt/lists/* \
&& openssl version \
&& curl -V

COPY --from=jmnote/openssl:1.1.1b /tmp/openssl.tgz /tmp/

RUN set -x \
&& cd /tmp/             \
&& tar xvzf openssl.tgz \
&& cp -a /tmp/openssl/openssl          /usr/local/bin/openssl                     \
&& cp -a /tmp/openssl/libssl.so.1.1    /usr/lib/x86_64-linux-gnu/libssl.so.1.1    \
&& cp -a /tmp/openssl/libcrypto.so.1.1 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 \
&& openssl version      \
&& curl -V              \
&& rm -rf /tmp/openssl/ \
EOF

docker build -t $IMAGE . && docker push $IMAGE
