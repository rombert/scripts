#!/bin/sh

if [ $# -ne 1 ]; then
        echo "Usage: $0 ssh_string"
        exit 1;
fi

conn=$1

echo "Creating directories using ssh"
ssh ${conn} 'mkdir .ssh; chmod 700 .ssh'
echo "Uploading key"
scp ~/.ssh/id_dsa.pub ${conn}:.ssh/authorized_keys
echo "Changing password"
ssh ${conn} passwd

