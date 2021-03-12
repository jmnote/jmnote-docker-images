set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/loki:2.2.0

cat <<'EOF' > Dockerfile
FROM grafana/loki:2.2.0
EOF

docker build -t $IMAGE . && docker push $IMAGE

