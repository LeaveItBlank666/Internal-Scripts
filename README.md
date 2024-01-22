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

 FTP Connection Tester

This script attempts to connect to FTP servers specified in a file, logs in with the provided credentials, and lists the contents of the FTP share.
Command:

      ./ftp_connection_tester.sh targets.txt

IMAP Connection Tester

This script attempts to connect to IMAP servers specified in a file using Telnet, sends LOGIN, CAPABILITY, and LIST commands, and displays the server response.
Command:

      ./imap_connection_tester.sh targets.txt

POP3 Connection Tester

This script attempts to connect to POP3 servers specified in a file using Telnet, sends USER, PASS, CAPA, and LIST commands, and displays the server response.

Command:

      ./pop3_connection_tester.sh targets.txt

SMB Connection Tester

This script attempts to connect to SMB servers specified in a file using smbclient, lists available shares, and displays the server response.

Command:

      ./smb_connection_tester.sh targets.txt

SMTP Connection Tester

This script attempts to connect to SMTP servers specified in a file using Telnet, sends a HELO command, and displays the server response.

   Command:

      ./smtp_connection_tester.sh targets.txt
