sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/default 2>/dev/null

# <3
nginx -g "daemon off;"