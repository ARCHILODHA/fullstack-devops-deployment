#!/bin/bash

# Display Docker disk usage and cleanup recommendations

echo "===================================="
echo "       DOCKER PRUNE REPORT"
echo "===================================="

if ! command -v docker &>/dev/null; then
    echo "Error: Docker is not installed."
    exit 1
fi

echo ""
echo "Docker disk usage:"
docker system df

echo ""
echo "Unused containers:"
docker ps -a --filter "status=exited"

echo ""
echo "Dangling images:"
docker images --filter "dangling=true"

echo ""
echo "Unused volumes:"
docker volume ls --filter "dangling=true"

echo ""
echo "Unused networks:"
docker network ls

echo ""
echo "Report completed."
echo "Run 'docker system prune' manually if cleanup is required."
