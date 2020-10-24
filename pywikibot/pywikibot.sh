set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

TAG=5.0.0

git clone --depth 1 -b $TAG https://github.com/wikimedia/pywikibot.git
cd pywikibot/

docker build -t jmnote/pywikibot:$TAG . && docker push jmnote/pywikibot:$TAG

