set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/ratsgo-embedding-cpu:1.4-dump-processed

cat <<'EOF' > Dockerfile
FROM ratsgo/embedding-cpu:1.4

RUN set -ax \
&& bash -x preprocess.sh dump-processed
EOF

docker build -t $IMAGE . && docker push $IMAGE

