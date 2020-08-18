set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM brightics/studio
EOF

docker build -t jmnote/brightics-studio:2020-07-29 .
docker push jmnote/brightics-studio:2020-07-29

