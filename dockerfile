# Use the official Ubuntu as a parent image
FROM debian:latest

# Install SSH server
RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y git nano systemctl 

RUN mkdir /var/run/sshd


# RUN apt-get update && apt-get install nginx -y

# RUN service nginx start

# Set a password for the root user (for demonstration purposes, consider using SSH keys for better security)
RUN echo 'root:12345678' | chpasswd

# Permit root login via SSH (again, this is for demonstration purposes, consider disabling root login or using SSH keys for better security)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# RUN service mysql start  
# RUN systemctl start apache2 
# RUN systemctl enable apache2

# Expose SSH port
EXPOSE 22
EXPOSE 3306
EXPOSE 80
EXPOSE 8088

# Copy a shell script into the container
# COPY my_script.sh /usr/local/bin/

# Make the script executable
# RUN chmod +x /usr/local/bin/my_script.sh

# Copy a shell script into the container
COPY my_script.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/my_script.sh

# Specify the script to run when the container starts
CMD ["my_script.sh"]
