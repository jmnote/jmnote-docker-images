set -ax
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

git clone --depth=1 https://github.com/marckhouzam/custom-prometheus-exporter.git
cd custom-prometheus-exporter
docker build -t jmnote/custom-prometheus-exporter:2020-11 .
docker push jmnote/custom-prometheus-exporter:2020-11

rm -rf /tmp/jmnote-docker-images

