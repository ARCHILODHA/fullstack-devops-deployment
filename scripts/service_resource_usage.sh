#!/bin/bash

# System service resource usage monitor

echo "===================================="
echo "     SERVICE RESOURCE USAGE"
echo "===================================="

if ! command -v systemctl &>/dev/null; then
    echo "Error: systemctl is unavailable."
    exit 1
fi

echo ""
echo "Active Services:"
echo ""

systemctl list-units \
    --type=service \
    --state=running \
    --no-pager

echo ""
echo "Service Memory Usage:"
echo ""

if command -v systemd-cgtop &>/dev/null; then
    systemd-cgtop --batch --iterations=1
else
    echo "systemd-cgtop is unavailable."
fi

echo ""
echo "Service resource report completed."
