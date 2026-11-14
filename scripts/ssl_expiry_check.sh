#!/bin/bash

# SSL certificate expiry checker

DOMAIN="$1"
PORT="${2:-443}"

echo "===================================="
echo "       SSL CERTIFICATE CHECK"
echo "===================================="

if [ -z "$DOMAIN" ]; then
    echo "Usage: ./ssl_expiry_check.sh example.com [port]"
    exit 1
fi

if ! command -v openssl &>/dev/null; then
    echo "Error: OpenSSL is not installed."
    exit 1
fi

expiry_date=$(echo | openssl s_client \
    -servername "$DOMAIN" \
    -connect "$DOMAIN:$PORT" 2>/dev/null |
    openssl x509 -noout -enddate 2>/dev/null |
    cut -d= -f2)

if [ -z "$expiry_date" ]; then
    echo "Unable to retrieve SSL certificate."
    exit 1
fi

expiry_epoch=$(date -d "$expiry_date" +%s 2>/dev/null)

if [ -z "$expiry_epoch" ]; then
    echo "Unable to parse certificate expiry date."
    exit 1
fi

current_epoch=$(date +%s)
remaining_days=$(( (expiry_epoch - current_epoch) / 86400 ))

echo "Domain: $DOMAIN"
echo "Certificate Expiry: $expiry_date"
echo "Days Remaining: $remaining_days"

if [ "$remaining_days" -lt 0 ]; then
    echo "WARNING: Certificate has expired!"
elif [ "$remaining_days" -le 30 ]; then
    echo "WARNING: Certificate expires within 30 days."
else
    echo "SSL certificate is valid."
fi
