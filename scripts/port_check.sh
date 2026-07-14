#!/bin/bash

read -p "Enter port number: " PORT

echo "Checking port $PORT..."
sudo netstat -tulnp | grep ":$PORT"
