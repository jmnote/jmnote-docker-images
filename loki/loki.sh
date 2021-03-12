set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/loki:21.03.0

cat <<'EOF' > Dockerfile
FROM grafana/loki
USER root
RUN apk --no-cache add curl
USER loki
EOF

docker build -t $IMAGE . && docker push $IMAGE

