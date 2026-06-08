#!/bin/bash

curl -f http://localhost:3000/health || exit 1
echo "Application healthy"
