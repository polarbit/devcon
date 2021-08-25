#!/bin/bash

echo "Started to initialize the container."

# For clients who connects via SSH
mkdir /home/dev/.ssh
echo $DEVCON_SSH_AUTH_KEY > /home/dev/.ssh/authorized_keys 

echo "Starting SSH server."
/etc/init.d/ssh start
/etc/init.d/ssh status

echo "The container is initialized."

tail -f /dev/null

echo "The container is started, listening /dev/null."