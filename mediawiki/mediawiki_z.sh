set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

cat <<'EOF' > Dockerfile
FROM composer:1.10.1 as vendor
ENV MEDIAWIKI_BRANCH=REL1_34
COPY --from=mediawiki:1.34.0 /var/www/html/ /var/www/html/
RUN cd /var/www/html/extensions/ \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/AntiSpoof.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/AbuseFilter.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/CheckUser.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/CharInsert.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/intersection.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/MsUpload.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/MultiBoilerplate.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/SendGrid.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/TemplateStyles.git \
&& git clone --depth 1 -b $MEDIAWIKI_BRANCH https://gerrit.wikimedia.org/r/mediawiki/extensions/Widgets.git \
&& git clone --depth 1 https://github.com/edwardspec/mediawiki-aws-s3.git AWS \
&& git clone --depth 1 https://github.com/jmnote/SimpleMathJax.git \
&& git clone --depth 1 https://github.com/jmnote/SimplePlantUML.git \
&& git clone --depth 1 https://github.com/jmnote/NewArticleTemplates.git \
&& git config --global advice.detachedHead false \
&& git clone --depth 1 -b v2.8.0 https://gitlab.com/hydrawiki/extensions/EmbedVideo.git \
&& rm -rf /var/www/html/extensions/*/.git* \
&& cd /var/www/html/extensions/AntiSpoof/ \
&& composer install --no-progress --no-suggest --profile --prefer-dist --optimize-autoloader \
&& cd /var/www/html/extensions/AWS/ \
&& composer install --no-progress --no-suggest --profile --prefer-dist --optimize-autoloader \
&& cd /var/www/html/extensions/TemplateStyles/ \
&& composer install --no-dev --no-progress --no-suggest --profile --prefer-dist --optimize-autoloader \
&& cd /var/www/html/extensions/Widgets/ \
&& composer update --no-dev --no-progress --no-suggest --profile --prefer-dist --optimize-autoloader \
&& cd /var/www/html/ \
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
illuminate/view:5.8.24

FROM mediawiki:1.34.0
COPY --from=vendor /var/www/html/ /var/www/html/
EOF

docker build -t jmnote/mediawiki:1.34.0-z .
docker push jmnote/mediawiki:1.34.0-z

