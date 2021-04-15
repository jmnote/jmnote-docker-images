set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/code-server:go

cat <<'EOF' > Dockerfile
FROM codercom/code-server

ENV GOLANG_VERSION=1.16.3
ENV GOPATH=/home/coder/go
ENV PATH=$PATH:/usr/local/go/bin

USER root
RUN set -x \
&& apt-get update && apt-get install -y \
  jq \
  vim \
  curl \
  tree \
  multitail \
  inotify-tools \
  openssh-server \
&& rm -rf /var/lib/apt/lists/* \
&& curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod +x /usr/local/bin/kubectl \
&& curl -LO https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz \
&& tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz \
&& rm -f go${GOLANG_VERSION}.linux-amd64.tar.gz

USER coder
RUN set -x \
&& code-server --install-extension golang.go

EOF

docker build -t $IMAGE . && docker push $IMAGE

