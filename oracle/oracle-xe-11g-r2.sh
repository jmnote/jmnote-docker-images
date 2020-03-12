set -ax
rm -rf /tmp/jmnote-docker-images; mkdir /tmp/jmnote-docker-images; cd /tmp/jmnote-docker-images

git clone --depth=1 https://github.com/wnameless/docker-oracle-xe-11g.git
cd docker-oracle-xe-11g
docker build -t jmnote/oracle-xe-11g-r2:11.2.0 .
docker push jmnote/oracle-xe-11g-r2:11.2.0

rm -rf /tmp/jmnote-docker-images
