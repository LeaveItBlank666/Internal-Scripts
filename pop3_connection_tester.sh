#!/bin/bash

# Check if the file containing IPs exists
if [[ ! -f "$1" ]]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Prompt user for username and password
read -p "Enter username: " pop3_username
read -s -p "Enter password: " pop3_password
echo # Print a new line after password input

# Read the file containing IPs and attempt POP3 connection for each IP using Telnet
while IFS= read -r ip; do
    echo "Attempting to connect to POP3 server at $ip on port 110 with username $pop3_username and password $pop3_password..."
    
    # Execute Telnet commands to connect to POP3 server and send USER, PASS, CAPA, and LIST commands
    if output=$(echo -e "USER $pop3_username\nPASS $pop3_password\nCAPA\nLIST\nQUIT" | telnet "$ip" 110 2>/dev/null); then
        echo "Successfully connected to POP3 server at $ip and executed USER, PASS, CAPA, and LIST commands."
        echo "Result:"
        echo "$output"
    else
        echo "Failed to connect to POP3 server at $ip or execute USER, PASS, CAPA, and LIST commands."
    fi
done < "$1"

echo "Script execution completed."
