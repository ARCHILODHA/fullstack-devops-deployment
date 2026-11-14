#!/bin/bash

# Firewall status monitoring script

echo "===================================="
echo "        FIREWALL STATUS"
echo "===================================="

if command -v ufw &>/dev/null; then

    echo ""
    echo "UFW Firewall Status:"
    sudo ufw status verbose

elif command -v firewall-cmd &>/dev/null; then

    echo ""
    echo "Firewalld Status:"
    sudo firewall-cmd --state

    echo ""
    echo "Active Firewall Zones:"
    sudo firewall-cmd --get-active-zones

    echo ""
    echo "Allowed Services:"
    sudo firewall-cmd --list-services

elif command -v iptables &>/dev/null; then

    echo ""
    echo "IPTables Rules:"
    sudo iptables -L -n -v

else

    echo "No supported firewall management tool found."
    exit 1

fi

echo ""
echo "Firewall inspection completed."
