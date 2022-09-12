#!/bin/bash
set -e

ln -sf \
/etc/nginx/sites-available/php-fpm.conf \
/etc/nginx/sites-enabled/php-fpm.conf
