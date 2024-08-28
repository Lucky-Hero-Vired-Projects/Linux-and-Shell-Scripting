#!/bin/bash

# Define the report file
REPORT_FILE="system_report.txt"
echo "Generating system report..." > "$REPORT_FILE"

# System uptime
echo "System Uptime:" >> "$REPORT_FILE"
uptime >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Memory usage
echo "Memory Usage:" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# CPU load
echo "CPU Load:" >> "$REPORT_FILE"
top -bn1 | grep "Cpu(s)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Disk usage
echo "Disk Usage:" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Running processes
echo "Running Processes:" >> "$REPORT_FILE"
ps aux --sort=-%mem | head -n 20 >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "System report is generated and saved to $REPORT_FILE"
