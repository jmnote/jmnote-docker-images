set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM docker.elastic.co/elasticsearch/elasticsearch-oss:7.6.0
EOF

docker build -t jmnote/elasticsearch-oss:7.6.0 .
docker push jmnote/elasticsearch-oss:7.6.0

