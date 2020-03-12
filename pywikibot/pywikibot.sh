set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

TAG=3.0.20190722
#TAG=3.0.20200111
#TAG=3.0.20200306

curl -LO https://github.com/wikimedia/pywikibot/archive/$TAG.tar.gz
tar xvzf $TAG.tar.gz
cd pywikibot-$TAG/scripts/
git clone --depth 1 https://gerrit.wikimedia.org/r/pywikibot/i18n.git
cd ..

cat <<'EOF' > Dockerfile
FROM python:3.8.2-slim-buster AS pip
ADD . /srv/pwb
RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential gcc git
RUN pip install --user --no-warn-script-location -r /srv/pwb/requirements.txt
RUN pip install --user --no-warn-script-location -r /srv/pwb/dev-requirements.txt
RUN pip install /srv/pwb/

FROM python:3.8.2-alpine3.11
#FROM python:3.8.2-slim-buster
#RUN apt-get update \
#&& apt-get install -y --no-install-recommends locales \
#&& rm -rf /var/lib/apt/lists/* \
#&& locale-gen C.UTF-8
ADD . /srv/pwb
COPY --from=pip /root/.local /root/.local
#ENV LC_ALL C.UTF-8
WORKDIR /srv/pwb
ENV PATH=/root/.local/bin:$PATH
EOF

docker build -t jmnote/pywikibot:$TAG . && docker push jmnote/pywikibot:$TAG

