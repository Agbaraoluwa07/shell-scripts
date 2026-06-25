#!/bin/bash
#Author: David Agbaraoluwa
#Date: June 2025
#Purpose: Checks node health - disk, memory, cpu, and processes
#Version: v1

set -e
set -o pipefail
set -x

echo "===== Disk Space ====="
df -h

echo "===== Memory Usage ====="
free -m

echo "===== CPU Count ====="
nproc

echo "===== All Running Processes ====="
ps -ef

echo "===== Filtered Processes (ubuntu user only) ====="
ps -ef | grep ubuntu

echo "===== PIDs of ubuntu processes only ====="
ps -ef | grep ubuntu | awk '{print $2}'

