#!/bin/sh
set -e

# Inject Google Client ID into the HTML
if [ -n "$GOOGLE_CLIENT_ID" ]; then
  sed -i "s|YOUR_GOOGLE_CLIENT_ID|${GOOGLE_CLIENT_ID}|g" /usr/share/nginx/html/index.html
  echo "✓ Google Client ID injected"
else
  echo "⚠ WARNING: GOOGLE_CLIENT_ID not set"
fi

# Substitute $PORT into nginx config (Railway sets this dynamically)
PORT=${PORT:-8080}
envsubst '${PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

echo "✓ nginx listening on port $PORT"

# Start nginx
exec nginx -g "daemon off;"
