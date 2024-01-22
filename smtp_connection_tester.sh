#!/bin/bash

# Check if the file containing IPs exists
if [[ ! -f "$1" ]]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Prompt user for username and password
read -p "Enter username: " smtp_username
read -s -p "Enter password: " smtp_password
echo # Print a new line after password input

# Read the file containing IPs and attempt SMTP connection for each IP using Telnet
while IFS= read -r ip; do
    echo "Attempting to connect to SMTP server at $ip on port 25 with username $smtp_username and password $smtp_password..."
    
    # Execute Telnet commands to connect to SMTP server and send HELO command
    if output=$(echo -e "HELO example.com\nquit" | telnet "$ip" 25 2>/dev/null); then
        echo "Successfully connected to SMTP server at $ip and executed HELO command."
        echo "Result:"
        echo "$output"
    else
        echo "Failed to connect to SMTP server at $ip or execute HELO command."
    fi
done < "$1"

echo "Script execution completed."

