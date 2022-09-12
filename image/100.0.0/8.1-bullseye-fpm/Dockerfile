#
# OPS NGINX
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
# @see https://github.com/aurelien-andre-weldom/ops-nginx
#
FROM ops-php/php:8.1-bullseye-fpm

ENV \
NGINX_VERSION="100.0.0" \
NGINX_VARIANT="8.1-bullseye-fpm" \
NGINX_WORKER_PROCESSES="5" \
NGINX_WORKER_CONNECTIONS="500"

USER root

RUN set -eux; \
apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
nginx

RUN set -eux; \
rm -rf \
/etc/nginx/sites-available/* \
/etc/nginx/sites-enabled/*

RUN set -eux; \
mkdir -p \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx; \
chmod 777 -R \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx; \
chown rootless:rootless \
/etc/nginx \
/var/log/nginx \
/var/lib/nginx

COPY --chown=rootless:rootless system .

RUN set -eux; \
chmod +x /usr/bin/docker-*

RUN set -eux; \
echo "docker-entrypoint-nginx.sh" >> /docker-entrypoint.list; \
echo "docker-entrypoint-nginx-sites.sh" >> /docker-entrypoint.list

ENTRYPOINT ["docker-entrypoint.sh"]

STOPSIGNAL SIGQUIT

EXPOSE 9001
EXPOSE 9080
EXPOSE 9443

CMD ["supervisord"]

USER rootless
