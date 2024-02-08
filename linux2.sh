#!/bin/bash

# Function to retrieve the public IP address using the ifconfig.me service
function ip ()
{
public_ip=$(curl -s ifconfig.me) # Using curl to fetch the public IP address
echo "1. Public IP: $public_ip"  # Printing the retrieved public IP address
echo ""
}

################################################################################

# Function to retrieve the private IP address of the system
function private()
{
private_ip=$(ip addr show | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | cut -d'/' -f1) # Extracting private IP address from ip addr show command
 echo "2. Private IP: $private_ip"  # Printing the retrieved private IP address
echo ""
}

# Function to retrieve the MAC address of the system
function mac() 
{
mac_address=$(ip link show | grep -oE '([0-9a-fA-F]{2}:){5}([0-9a-fA-F]{2})' | head -n 1) # Extracting MAC address from ip link show command
echo "3. MAC Address: ${mac_address:0:9}XX:XX:XX"  # Printing the retrieved MAC address
}

################################################################################

# Function to display CPU usage for top 5 processes
function cpu()
{
echo "4. CPU Usage for Top 5 Processes:" 
top_output=$(top -b -n 1 | tail -n +8 | head -n 5) # Retrieving CPU usage information for top 5 processes using the top command
echo "$top_output"  # Printing the retrieved CPU usage information
}

################################################################################

# Function to display hard disk size, free, and used space
function hard()
{
echo " Hard disk size, free, and used space:"
echo ""
df -h  # Using df command to display hard disk usage information
echo ""
}

################################################################################

# Function to display active system services with their status
function services() 
{
echo "6. Active System Services with Status:"
service_status=$(systemctl list-units --type=service --state=active | grep service) # Retrieving active system services and their status using systemctl
echo "$service_status"  # Printing the retrieved service status
}

################################################################################

# Function to display the top 10 largest files in the /home directory
function files() 
{
echo "7. Top 10 Largest Files in /home:"
largest_files=$(du -ah /home 2>/dev/null | sort -rh | head -n 10) # Finding top 10 largest files in /home directory
echo "$largest_files" | awk '{ printf "%-8s %s\n", $1, $2 }'  # Printing the retrieved largest files with their sizes
}

# Calling all the defined functions in order to execute the script
ip
private
mac
cpu
hard
services
files