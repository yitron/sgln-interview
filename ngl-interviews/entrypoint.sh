#!/bin/sh
set -e

# Inject the Google Client ID from Railway environment variable into the HTML
# Replaces the placeholder string so the JS picks it up at runtime
if [ -n "$GOOGLE_CLIENT_ID" ]; then
  sed -i "s|YOUR_GOOGLE_CLIENT_ID|${GOOGLE_CLIENT_ID}|g" /usr/share/nginx/html/index.html
  echo "✓ Google Client ID injected"
else
  echo "⚠ WARNING: GOOGLE_CLIENT_ID environment variable is not set"
fi

# Start nginx (env substitution for PORT is handled by nginx template)
nginx -g "daemon off;"
EOF
