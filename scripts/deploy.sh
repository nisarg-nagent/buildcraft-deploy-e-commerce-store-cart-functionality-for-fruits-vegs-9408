#!/usr/bin/env sh
set -eu

COMPOSE_FILE=${COMPOSE_FILE:-docker-compose.prod.yml}
PROJECT_NAME=${PROJECT_NAME:-freshcart-market}

if [ ! -f "$COMPOSE_FILE" ]; then
  echo "Compose file not found: $COMPOSE_FILE" >&2
  exit 1
fi

if [ -z "${POSTGRES_PASSWORD:-}" ]; then
  echo "POSTGRES_PASSWORD is required" >&2
  exit 1
fi

if [ -z "${JWT_SECRET:-}" ]; then
  echo "JWT_SECRET is required" >&2
  exit 1
fi

echo "Deploying $PROJECT_NAME using $COMPOSE_FILE"
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" pull || true
docker compose -p "$PROJECT_NAME" -f "$COMPOSE_FILE" up -d --build --remove-orphans

echo "Waiting for services to become healthy..."
sleep 10
./scripts/healthcheck.sh

echo "Deployment completed successfully."
