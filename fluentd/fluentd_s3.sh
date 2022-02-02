set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/fluentd:v1.14-1_s3

cat <<'EOF' > Dockerfile
FROM fluentd:v1.14-1
USER root
RUN apk add --no-cache --update --virtual .build-deps \
sudo build-base ruby-dev \
&& sudo gem install \
fluent-plugin-s3 \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem /usr/lib/ruby/gems/2.*/gems/fluentd-*/test
USER fluent
EOF

docker build -t $IMAGE . && docker push $IMAGE
