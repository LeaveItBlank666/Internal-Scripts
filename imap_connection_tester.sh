#!/bin/bash

# Check if the file containing IPs exists
if [[ ! -f "$1" ]]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Prompt user for username and password
read -p "Enter username: " imap_username
read -s -p "Enter password: " imap_password
echo # Print a new line after password input

# Read the file containing IPs and attempt IMAP connection for each IP using Telnet
while IFS= read -r ip; do
    echo "Attempting to connect to IMAP server at $ip on port 143 with username $imap_username and password $imap_password..."
    
    # Execute Telnet commands to connect to IMAP server and send LOGIN, CAPABILITY, and LIST commands
    if output=$(echo -e "LOGIN $imap_username $imap_password\nCAPABILITY\nLIST \"\" \"*\"\nLOGOUT" | telnet "$ip" 143 2>/dev/null); then
        echo "Successfully connected to IMAP server at $ip and executed LOGIN, CAPABILITY, and LIST commands."
        echo "Result:"
        echo "$output"
    else
        echo "Failed to connect to IMAP server at $ip or execute LOGIN, CAPABILITY, and LIST commands."
    fi
done < "$1"

echo "Script execution completed."
