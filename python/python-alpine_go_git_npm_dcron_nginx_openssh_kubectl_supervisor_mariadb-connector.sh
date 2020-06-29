set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/python:3.8.3-alpine-go-git-npm-dcron-nginx-openssh-kubectl-supervisor-mariadb-connector

cat <<'EOF' > Dockerfile
FROM python:3.8.3-alpine

## https://github.com/nginxinc/docker-nginx/blob/594ce7a8bc26c85af88495ac94d5cd0096b306f7/mainline/alpine/Dockerfile
ENV NGINX_VERSION 1.17.10
ENV NJS_VERSION   0.3.9
ENV PKG_RELEASE   1

RUN set -ax \
&& apk --no-cache add \
  go \
  git \
  npm \
  curl \
  make \
  dcron \
  nginx \
  openssh \
  musl-dev \
  supervisor \
  mariadb-connector-c-dev build-base \
&& curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
&& chmod +x /usr/local/bin/kubectl

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

EOF

docker build -t $IMAGE . && docker push $IMAGE

