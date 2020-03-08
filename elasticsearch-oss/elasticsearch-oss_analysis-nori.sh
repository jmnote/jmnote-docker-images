set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.6.0
RUN bin/elasticsearch-plugin install analysis-nori
EOF

docker build -t jmnote/elasticsearch-oss:7.6.0-analysis-nori .
docker push jmnote/elasticsearch-oss:7.6.0-analysis-nori

