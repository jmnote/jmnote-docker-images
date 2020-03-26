set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM composer:1.10.1 as vendor
RUN composer create-project --no-progress --profile --prefer-dist laravel/laravel app "7.3.0" \
&& composer require \
--ignore-platform-reqs \
--no-progress \
--no-suggest \
--profile \
--no-interaction \
--no-plugins \
--no-scripts \
--prefer-dist \
--optimize-autoloader \
predis/predis:1.1.1 \
hybridauth/hybridauth:v3.2.0

FROM php:7.3-fpm-alpine
COPY --from=vendor /app/ /app/
EOF

docker build -t jmnote/laravel:7.3.0-z .
docker push jmnote/laravel:7.3.0-z

