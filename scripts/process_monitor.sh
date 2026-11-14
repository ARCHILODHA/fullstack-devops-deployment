
#!/bin/bash

# Process resource monitoring script

echo "===================================="
echo "        PROCESS MONITOR"
echo "===================================="

if ! command -v ps &>/dev/null; then
    echo "Error: ps command is unavailable."
    exit 1
fi

echo ""
echo "Top 10 CPU-consuming processes:"
echo ""

ps -eo pid,ppid,comm,%cpu,%mem --sort=-%cpu | head -n 11

echo ""
echo "Top 10 memory-consuming processes:"
echo ""

ps -eo pid,ppid,comm,%cpu,%mem --sort=-%mem | head -n 11

echo ""
echo "Total running processes: $(ps -e --no-headers | wc -l)"

echo ""
echo "Process monitoring completed."
