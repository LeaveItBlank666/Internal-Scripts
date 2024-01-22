#!/bin/bash

# Check if the file containing IPs exists
if [[ ! -f "$1" ]]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Prompt user for username and password
read -p "Enter username: " smb_username
read -s -p "Enter password: " smb_password
echo # Print a new line after password input

# Read the file containing IPs and attempt SMB connection for each IP using smbclient
while IFS= read -r ip; do
    echo "Attempting to connect to SMB server at $ip with username $smb_username and password $smb_password..."
    
    # Attempt to connect to SMB server and list available shares
    if smbclient -U "$smb_username"%"$smb_password" -L "$ip" -I "$ip" >/dev/null 2>&1; then
        echo "Successfully connected to SMB server at $ip and listed available shares."
    else
        echo "Failed to connect to SMB server at $ip or list available shares."
    fi
done < "$1"

echo "Script execution completed."
