set -x
mkdir /tmp/phpmyadmin-google-apiclient
cd /tmp/phpmyadmin-google-apiclient

cat <<EOF > Dockerfile
FROM composer:1.9.3 as vendor
RUN composer require \
--ignore-platform-reqs \
--no-interaction \
--no-plugins \
--no-scripts \
--prefer-dist \
google/apiclient:"^2.0"

FROM phpmyadmin/phpmyadmin:5.0.1-fpm-alpine
WORKDIR /app
COPY --from=vendor /app/vendor/ /app/vendor/
EOF

docker build -t jmnote/phpmyadmin:5.0.1-fpm-alpine-google-apiclient .
docker push jmnote/phpmyadmin:5.0.1-fpm-alpine-google-apiclient

rm -rf /tmp/phpmyadmin-google-apiclient
