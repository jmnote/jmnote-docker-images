set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/code-server:go

cat <<'EOF' > Dockerfile
FROM linuxserver/code-server:4.4.0

RUN DOCKER_MODS=linuxserver/mods:code-server-golang-1.18.2  /init exit; exit 0
RUN DOCKER_MODS=linuxserver/mods:code-server-nodejs         /init exit; exit 0

ENV GOPATH=/go
ENV GOLANG_VERSION=1.18.2
ENV PATH=$PATH:/usr/local/go/bin:/go/bin

RUN set -x \
&& apt install -y make \
&& install-extension golang.go \
&& install-extension johnsoncodehk.volar \
&& go install github.com/cweill/gotests/gotests@latest \
&& go install github.com/fatih/gomodifytags@latest \
&& go install github.com/josharian/impl@latest \
&& go install github.com/haya14busa/goplay/cmd/goplay@latest \
&& go install github.com/go-delve/delve/cmd/dlv@latest \
&& go install honnef.co/go/tools/cmd/staticcheck@latest \
&& go install golang.org/x/tools/gopls@latest
EOF


docker build -t $IMAGE . && docker push $IMAGE
