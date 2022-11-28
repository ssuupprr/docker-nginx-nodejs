FROM alpine:3.16
MAINTAINER Ssuupprr (https://github.com/Ssuupprr/docker-nginx-nodejs)

# Add s6-overlay
ARG S6_OVERLAY_VERSION=3.1.2.1

RUN apk add --update --no-cache bind-tools curl xz nginx nodejs && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz \
    | tar -C / -xvJf && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz \
    | tar -C / -xvJf && \
    apk del curl && \
    corepack enable

ADD root /
ENTRYPOINT ["/init"]
