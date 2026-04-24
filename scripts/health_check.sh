#!/bin/bash

URL="http://localhost:3000"

STATUS=$(curl -o /dev/null -s -w "%{http_code}" $URL)

if [ $STATUS -eq 200 ]; then
  echo "Service is healthy"
else
  echo "Service down"
fi
