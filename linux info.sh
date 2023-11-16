#!/bin/bash

function version()
{
#Display the Linux version.
echo " Linux version:"
echo ""
uname -a
echo ""
}
version
####################################################################
####################################################################


function ip()
{
#Display private IP address, public IP address, and default gateway.
echo "   Private IP address:"
echo ""
ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}'
echo ""
echo "   Public IP address:"
echo ""
curl ifconfig.me
echo ""
echo "   Default Gateway:"
echo ""
ip route | grep default | awk '{print $3}'
echo ""
}
ip
####################################################################
####################################################################


function hard()
{
#Display hard disk size, free, and used space
echo " Hard disk size, free, and used space:"
echo ""
df -h
echo ""
}
hard
####################################################################
####################################################################


function size()
{
#Display the top five directories and their size.
echo " Top five directories and their size:"
echo ""
du -h --max-depth=1 | sort -hr | head -n 6
echo ""
}
size 
####################################################################
####################################################################


function cpu()
{
# Display CPU usage, refresh every 10 seconds.
echo "CPU usage (refresh every 10 seconds):"
echo ""
top -b -d 10 -n 5
echo ""
}
cpu
