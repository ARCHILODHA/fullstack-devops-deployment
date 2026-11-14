#!/bin/bash

# Check Docker container health status

echo "===================================="
echo "       CONTAINER HEALTH CHECK"
echo "===================================="

if ! command -v docker &>/dev/null; then
    echo "Error: Docker is not installed."
    exit 1
fi

containers=$(docker ps -q)

if [ -z "$containers" ]; then
    echo "No running containers found."
    exit 0
fi

printf "%-25s %-20s\n" "CONTAINER" "HEALTH STATUS"
echo "----------------------------------------------"

for container in $containers; do

    name=$(docker inspect --format '{{.Name}}' "$container" | sed 's|^/||')

    health=$(docker inspect \
        --format '{{if .State.Health}}{{.State.Health.Status}}{{else}}No healthcheck configured{{end}}' \
        "$container")

    printf "%-25s %-20s\n" "$name" "$health"

done

echo ""
echo "Health check completed."
