set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/ratsgo-embedding-cpu:1.4-dump-tokenized

cat <<'EOF' > Dockerfile
FROM ratsgo/embedding-cpu:1.4

RUN set -ax \
&& bash -x preprocess.sh dump-tokenized
EOF

docker build -t $IMAGE . && docker push $IMAGE

