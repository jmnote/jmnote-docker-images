set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/fluentd:v1.9.3-1.0_elasticsearch_rewrite-tag-filter_kubernetes-metadata-filter

cat <<'EOF' > Dockerfile
FROM fluent/fluentd:v1.9.3-1.0
USER root
RUN apk add --no-cache --update --virtual .build-deps \
sudo build-base ruby-dev \
&& sudo gem install \
fluent-plugin-elasticsearch \
fluent-plugin-rewrite-tag-filter \
fluent-plugin-kubernetes_metadata_filter \
&& sudo gem sources --clear-all \
&& apk del .build-deps \
&& rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
USER fluent
EOF

docker build -t $IMAGE . && docker push $IMAGE
