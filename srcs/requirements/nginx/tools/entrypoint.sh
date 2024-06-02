sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /etc/nginx/sites-available/default 2>/dev/null

# <3
echo "Nginx is running..."
nginx -g "daemon off;"