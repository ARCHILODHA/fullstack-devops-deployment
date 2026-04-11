#!/bin/bash

echo "Removing stopped containers..."
docker container prune -f

echo "Removing unused images..."
docker image prune -f
