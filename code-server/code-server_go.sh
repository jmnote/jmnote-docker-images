set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/code-server:go

cat <<'EOF' > Dockerfile
FROM codercom/code-server

ENV GOLANG_VERSION=1.16.3
ENV GOPATH=/root/go
ENV PATH=$PATH:/usr/local/go/bin

USER root
RUN set -x \
&& apt-get update && apt-get install -y \
  jq \
  vim \
  curl \
  tree \
  netcat \
  multitail \
  inotify-tools \
  openssh-server \
&& rm -rf /var/lib/apt/lists/* \
&& curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod +x /usr/local/bin/kubectl \
&& curl -LO https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz \
&& tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz \
&& rm -f go${GOLANG_VERSION}.linux-amd64.tar.gz \
&& mkdir -p $GOPATH \
&& cd $GOPATH \
&& code-server --install-extension golang.go \
&& go get golang.org/x/tools/gopls \
&& go get github.com/uudashr/gopkgs/v2/cmd/gopkgs \
&& go get github.com/ramya-rao-a/go-outline       \
&& go get github.com/go-delve/delve/cmd/dlv       \
&& go get honnef.co/go/tools/cmd/staticcheck

WORKDIR /root/go
EOF

docker build -t $IMAGE . && docker push $IMAGE

