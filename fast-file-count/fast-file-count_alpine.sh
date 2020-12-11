set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

BASE=alpine
IMAGE=fast-file-count:alpine
cat <<EOF > Dockerfile
FROM $BASE as builder
RUN apk add --no-cache \
  git \
  build-base \
&& git clone https://github.com/ChristopherSchultz/fast-file-count.git \
&& cd fast-file-count/ \
&& gcc dircnt.c -o /usr/local/bin/dircnt \
&& dircnt

FROM $BASE
COPY --from=builder /usr/local/bin/dircnt /usr/local/bin/
EOF

docker build -t jmnote/$IMAGE .
docker push     jmnote/$IMAGE

