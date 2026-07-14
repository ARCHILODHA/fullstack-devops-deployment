#!/bin/bash

echo "Removing unused Docker volumes..."
docker volume prune -f

echo "Unused volumes removed."
