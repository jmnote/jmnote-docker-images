set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/code-server:go

cat <<'EOF' > Dockerfile
FROM linuxserver/code-server:4.4.0
RUN DOCKER_MODS=linuxserver/mods:code-server-golang-1.18.2 /init exit; exit 0
RUN DOCKER_MODS=linuxserver/mods:code-server-nodejs-16     /init exit; exit 0
RUN install-extension golang.go
RUN install-extension vue.volar

ENV GOPATH=/go
ENV GOLANG_VERSION=1.18.2
ENV PATH=$PATH:/go/bin

RUN set -x \
&& go install golang.org/x/tools/gopls@latest \
&& go intsll github.com/ramya-rao-a/go-outline@latest \
&& go install github.com/cosmtrek/air@latest

WORKDIR /go
EOF

docker build -t $IMAGE . && docker push $IMAGE
