#!/bin/bash

# Start SSH
/usr/sbin/sshd -D &

# Enable Apache2 and start MySQL and Apache2
# service mysql start

# systemctl enable apache2

# systemctl start apache2

# Keep the script running to keep the container running
tail -f /dev/null
