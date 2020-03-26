set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM mediawiki:1.34.0
EOF

docker build --squash -t jmnote/mediawiki:1.34.0-squash . \
&& docker push jmnote/mediawiki:1.34.0-squash

