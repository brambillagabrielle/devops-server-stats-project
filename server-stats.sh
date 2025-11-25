#!/bin/bash

# Additional stats/informations
hostname=$(hostname)
os_version=$(awk -F '=' '/PRETTY_NAME/ {print $2}' /etc/os-release | tr -d '"')
uptime=$(uptime -p)
up_since=$(uptime -s)
load_average=$(uptime | awk -F ': ' '{ print $2 }')
logged_users=$(who -q | awk -F '=' '/users/ {print $2}')
failed_login_attempts=$(cat /var/log/auth.log | grep "incorrect password" | wc -l)

echo "$hostname | Server Stats:"
echo " |_ OS Version: $os_version"
echo " |_ Uptime: $uptime (since $up_since)"
echo " |_ Load Average: $load_average"
echo " |_ Logged Users: $logged_users"
echo " |_ Failed Login Attempts: $failed_login_attempts"
echo

# Total CPU usage
total_cpu_usage=$(awk -f ./awk-scripts/cpu/total.awk /proc/stat)

echo " -> Total CPU Usage: $total_cpu_usage"
echo

# Top 5 processes by CPU usage
echo "___ Top 5 Processes by CPU Usage ___"
ps aux --sort -%cpu | head -n 5
echo

# Total memory usage (Free vs Used including percentage)
total_memory=$(awk -f ./awk-scripts/memory/total.awk /proc/meminfo)
free_memory=$(awk -f ./awk-scripts/memory/free.awk /proc/meminfo)
used_memory=$(awk -f ./awk-scripts/memory/used.awk /proc/meminfo)

echo " -> Total Memory Usage: $total_memory (100%)"
echo "    |_ Free Memory: $free_memory"
echo "    |_ Used Memory: $used_memory"
echo

# Total disk usage (Free vs Used including percentage)
total_disk=$(df --total | awk -f ./awk-scripts/disk/total.awk)
free_disk=$(df --total | awk -f ./awk-scripts/disk/free.awk)
used_disk=$(df --total | awk -f ./awk-scripts/disk/used.awk)

# Top 5 processes by memory usage
echo "___ Top 5 Processes by Memory Usage ___"
ps aux --sort -%mem | head -n 5
echo

echo " -> Total Disk Usage: $total_disk (100%)"
echo "    |_ Free Memory: $free_disk"
echo "    |_ Used Memory: $used_disk"
echo