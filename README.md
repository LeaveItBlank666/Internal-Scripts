# Network Protocol Connection Testers

![Hackers](https://img.shields.io/badge/For%20Hackers-%E2%9A%A1%EF%B8%8F-black.svg)

A collection of Bash scripts designed to test various network protocols. This repository includes scripts for testing FTP, IMAP, POP3, SMTP, and SMB connections.

## Usage

1. Ensure you have a file containing a list of target IPs. Each IP should be on a new line.

   ```bash
   Example: targets.txt
   192.168.1.1
   192.168.1.2

Example for SMB:
chmod +x smb_connection_tester.sh  # Make the script executable
./smb_connection_tester.sh targets.txt

You will be prompted to enter the protocol-specific credentials.

    Enter username: your_username
    Enter password: your_password

    The script will attempt to connect to each IP using the provided credentials and provide relevant information.

Important Notes

    Make sure to have the necessary permissions and authorization to perform tests on the target servers.
    Ensure that the required utilities for each protocol are installed on your system.

Example Output (SMB)

Attempting to connect to SMB server at 192.168.1.1 with username your_username and password your_password...
Successfully connected to SMB server at 192.168.1.1 and listed available shares.
Attempting to connect to SMB server at 192.168.1.2 with username your_username and password your_password...
Failed to connect to SMB server at 192.168.1.2 or list available shares.
Script execution completed.

    Inspired by the need for quick network protocol testing.
