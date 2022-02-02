set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

TAG=v0.37.0

git clone --depth=1 -b $TAG https://github.com/GoogleCloudPlatform/gcsfuse.git
cd gcsfuse/

docker build -t jmnote/gcsfuse:$TAG .
docker push jmnote/gcsfuse:$TAG
