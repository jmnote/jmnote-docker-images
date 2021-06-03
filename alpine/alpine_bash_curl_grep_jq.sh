set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

BASE=alpine:3.13.5
PACKAGES=(
bash
curl
grep
jq
)

IMAGE=$(echo "jmnote/$BASE-${PACKAGES[@]}" | sed 's/ /-/g')
echo IMAGE=$IMAGE

cat <<EOF > Dockerfile
FROM $BASE
RUN apk add --no-cache ${PACKAGES[@]}
EOF

docker build -t $IMAGE . && \
docker push     $IMAGE
