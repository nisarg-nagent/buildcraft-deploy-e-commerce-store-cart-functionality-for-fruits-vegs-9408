#!/usr/bin/env sh
set -eu

BACKEND_URL=${BACKEND_URL:-http://localhost:8001}
FRONTEND_URL=${FRONTEND_URL:-http://localhost:3000}
MAX_ATTEMPTS=${MAX_ATTEMPTS:-30}
SLEEP_SECONDS=${SLEEP_SECONDS:-3}

check_url() {
  name=$1
  url=$2
  attempt=1

  while [ "$attempt" -le "$MAX_ATTEMPTS" ]; do
    if wget -qO- "$url" >/dev/null 2>&1; then
      echo "$name healthy: $url"
      return 0
    fi

    echo "$name not ready yet ($attempt/$MAX_ATTEMPTS): $url"
    attempt=$((attempt + 1))
    sleep "$SLEEP_SECONDS"
  done

  echo "$name health check failed: $url" >&2
  return 1
}

check_url "backend" "$BACKEND_URL/api/health"
check_url "frontend" "$FRONTEND_URL/"

echo "All health checks passed."
