#!/bin/bash

# Check if the file containing IPs exists
if [[ ! -f "$1" ]]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

# Prompt user for username and password
read -p "Enter username: " ftp_username
read -s -p "Enter password: " ftp_password
echo # Print a new line after password input

# Read the file containing IPs and attempt FTP connection for each IP
while IFS= read -r ip; do
    echo "Attempting to connect to FTP server at $ip with username $ftp_username and password $ftp_password..."
    
    # Execute FTP commands to list contents of FTP share
    if ftp -n "$ip" <<END_SCRIPT
        quote USER "$ftp_username"
        quote PASS "$ftp_password"
        ls
        quit
END_SCRIPT
    then
        echo "Successfully listed contents of FTP share on server at $ip."
    else
        echo "Failed to list contents of FTP share on server at $ip."
    fi
done < "$1"

echo "Script execution completed."

