set -x
rm -rf /tmp/jmnote-docker-images
mkdir /tmp/jmnote-docker-images
cd /tmp/jmnote-docker-images

IMAGE=jmnote/python:3.8.2-alpine-cloud-sdk-supervisor-openssh-server

cat <<'EOF' > Dockerfile
## https://github.com/GoogleCloudPlatform/cloud-sdk-docker/blob/929dc972df3c2ddd4e855785bb948129d4c9cc15/alpine/Dockerfile
FROM docker:17.12.0-ce as static-docker-source

#FROM alpine:3.11
FROM python:3.8.2-alpine

ARG CLOUD_SDK_VERSION=289.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION
ENV CLOUDSDK_PYTHON=python3

ENV PATH /google-cloud-sdk/bin:$PATH
COPY --from=static-docker-source /usr/local/bin/docker /usr/local/bin/docker
RUN apk --no-cache add \
        curl \
        python3 \
        py3-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg \
        supervisor \
        openssh-server \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version
VOLUME ["/root/.config"]

EOF

docker build -t $IMAGE . && docker push $IMAGE

