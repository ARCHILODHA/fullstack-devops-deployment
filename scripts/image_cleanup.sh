#!/bin/bash

docker image prune -a -f
echo "Unused Docker images removed."
