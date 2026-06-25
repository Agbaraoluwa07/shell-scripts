#!/bin/bash
#Author: David Agbaraoluwa
#purpose: Display full network information for the current machine
set -e
echo "===================="
echo "Network Information Report"
echo "Generated: $(date)"
echo "===================="

echo " "
echo "--- IP Addresses ---"
ip addr show | grep "inet" | awk '{print $2, "on", $NF}'

echo " "
echo "--- Default Gateway ---"
ip route | grep default

echo " "
echo "--- DNS Servers ---"
cat /etc/resolv. conf | grep nameserver

echo " "
echo "--- Hostname ---"
hostname
hostname -I

echo " "
echo "--- Open Ports ---"
sudo ss -tulnp | grep LISTEN 

echo " "
echo "--- Active Connections ---"
sudo ss -tnp | grep ESTABLISHED | head -10

echo " "
echo "===================="
echo "Report Complete."
echo "===================="

