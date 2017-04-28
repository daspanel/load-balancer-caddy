FROM daspanel/alpine-base
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

# Parse arguments for the build command.
ARG VERSION
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

# Set default env variables
ENV \
    # Stop container initialization if error occurs in cont-init.d, fix-attrs.d script's
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \

    # Timezone
    TZ="UTC" 

# A little bit of metadata management.
# See http://label-schema.org/  
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="daspanel/load-balancer-caddy" \
      org.label-schema.description="This service provides HTTP static engine daemon to Daspanel."

ARG CADDY_PLUGINS="http.cors,http.expires,http.ipfilter,http.minify,http.ratelimit,http.realip,tls.dns.cloudflare,tls.dns.digitalocean,tls.dns.linode,tls.dns.route53"
ARG CADDY_URL="https://caddyserver.com/download/linux/amd64?plugins=${CADDY_PLUGINS}"

RUN set -x \

    && apk --update --no-cache add --virtual=build_deps curl \
    && apk add --no-cache --update libcap mailcap \
    && curl --silent --show-error --fail --location \
        --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
        "${CADDY_URL}" \
        | tar --no-same-owner -C /usr/sbin/ -xz caddy \
    && chmod 0755 /usr/sbin/caddy \
    && setcap "cap_net_bind_service=+ep" /usr/sbin/caddy \
    && apk del build_deps \
    && rm -rf \
        /var/cache/apk/* \
        /tmp/src \
        /tmp/*

# Inject files in container file system
COPY rootfs /

# Expose ports for the service
EXPOSE 80 443
