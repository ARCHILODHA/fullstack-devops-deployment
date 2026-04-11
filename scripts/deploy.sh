#!/bin/bash

echo "Building Docker image..."
docker build -t app .

echo "Running container..."
docker run -d -p 3000:3000 app
