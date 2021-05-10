set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<EOF > Dockerfile
FROM google/cloud-sdk:alpine
RUN set -eux && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv kubectl /usr/local/bin/
EOF

docker build -t jmnote/cloud-sdk:alpine-kubectl .
docker push jmnote/cloud-sdk:alpine-kubectl
