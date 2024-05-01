#!/bin/bash
cd /var/www/html
curl -O https://wordpress.org/latest.zip
unzip latest.zip

exec "$@"