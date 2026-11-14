#!/bin/bash

# Docker Compose service restart script

COMPOSE_FILE="${1:-docker-compose.yml}"

echo "===================================="
echo "     DOCKER COMPOSE RESTART"
echo "===================================="

if ! command -v docker &>/dev/null; then
    echo "Error: Docker is not installed."
    exit 1
fi

if [ ! -f "$COMPOSE_FILE" ]; then
    echo "Error: Compose file not found: $COMPOSE_FILE"
    exit 1
fi

if ! docker compose version &>/dev/null; then
    echo "Error: Docker Compose plugin is unavailable."
    exit 1
fi

echo "Using Compose file: $COMPOSE_FILE"

echo ""
echo "Restarting services..."

if docker compose -f "$COMPOSE_FILE" restart; then
    echo ""
    echo "Services restarted successfully."
else
    echo "Error: Failed to restart services."
    exit 1
fi

echo ""
echo "Current service status:"
docker compose -f "$COMPOSE_FILE" ps
