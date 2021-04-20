set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/openssl-test

cat <<'EOF' > Dockerfile
FROM debian:10

RUN set -x \
&& apt-get update && apt-get install -y openssl \
&& openssl version \
&& curl -V

COPY --from=jmnote/openssl:1.1.1b-debian-10 /usr/local/bin/openssl /usr/local/bin/openssl
COPY --from=jmnote/openssl:1.1.1b-debian-10 /usr/local/lib/libssl.so.1.1 /usr/lib/x86_64-linux-gnu/libssl.so.1.1

RUN set -x \
&& openssl version \
&& curl -V
EOF

docker build -t $IMAGE . && docker push $IMAGE
