#!/bin/bash

read -p "Enter service name: " SERVICE

systemctl status "$SERVICE"
