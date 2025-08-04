#!/bin/bash

echo "===== SERVER PERFORMANCE STATS ====="
echo

# OS Version
echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME
echo

# Uptime
echo "Uptime:"
uptime -p
echo

# Load Average
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'
echo

# Logged in users
echo "Logged in Users:"
who
echo

# CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
  awk '{print "Used: " 100 - $8 "%, Idle: " $8 "%"}'
echo

# Memory Usage
echo "Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s, Free: %s, Usage: %.2f%%\n", $3, $4, $3*100/$2 }'
echo

# Disk Usage
echo "Disk Usage:"
df -h / | awk 'NR==2{printf "Used: %s, Free: %s, Usage: %s\n", $3, $4, $5}'
echo

# Top 5 processes by CPU
echo "Top 5 CPU-consuming Processes:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# Top 5 processes by Memory
echo "Top 5 Memory-consuming Processes:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

# (Optional) Failed login attempts (need sudo)
echo "Failed Login Attempts:"
lastb | head -n 5

