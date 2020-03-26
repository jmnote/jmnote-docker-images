set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM composer:1.10.1 as vendor
COPY --from=mediawiki:1.34.0 /var/www/html/ /app/
RUN cd /app/ \
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
aws/aws-sdk-php:3.108.3 \
illuminate/view:5.8.24

FROM mediawiki:1.34.0
COPY --from=vendor /app/vendor/ /var/www/html/vendor/
EOF

docker build -t jmnote/mediawiki:1.34.0-z .
docker push jmnote/mediawiki:1.34.0-z

