#!/bin/sh
set -e

# Replace PORT in nginx config with actual PORT from environment
PORT=${PORT:-8080}
sed -i.bak "s/listen .*/listen ${PORT};/" /etc/nginx/conf.d/default.conf && rm -f /etc/nginx/conf.d/default.conf.bak

echo "Nginx config updated. Testing..."
nginx -t

exec nginx -g 'daemon off;'

