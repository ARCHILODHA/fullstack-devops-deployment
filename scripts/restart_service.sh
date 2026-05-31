#!/bin/bash

SERVICE_NAME=$1

sudo systemctl restart $SERVICE_NAME
echo "$SERVICE_NAME restarted successfully."
