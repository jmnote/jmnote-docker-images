set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM composer:1.9.3 as vendor
RUN composer require \
--ignore-platform-reqs \
--no-interaction \
--no-plugins \
--no-scripts \
--prefer-dist \
j7mbo/twitter-api-php:"1.0.6"

FROM phpmyadmin/phpmyadmin:5.0.1-fpm-alpine
WORKDIR /
COPY --from=vendor /app/vendor/ /vendor/
EOF

docker build -t jmnote/phpmyadmin:5.0.1-fpm-alpine-twitter-api-php .
docker push jmnote/phpmyadmin:5.0.1-fpm-alpine-twitter-api-php

