#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step000_Install_ansible.sh | bash"

# Validate Desired user and hostname
REQUIRED_USER="ansible"
DESIRED_HOSTNAME="Ansible-Con-troller"

# Verify current user
if [ "$USER" != "$REQUIRED_USER" ]; then
    echo "Error: This script must be run as user '$REQUIRED_USER'. Current user is '$USER'."
    exit 1
else
    echo "Required User Name is Valid."
    
fi

# Current hostname
CURRENT_HOSTNAME=$(hostname)
echo "Current hostname is: $CURRENT_HOSTNAME"

# Validate and set hostname if needed
if [ "$CURRENT_HOSTNAME" != "$DESIRED_HOSTNAME" ]; then
    echo "Hostname mismatch! Updating to '$DESIRED_HOSTNAME'..."

    # Set hostname persistently (requires sudo privileges)
    sudo hostnamectl set-hostname "$DESIRED_HOSTNAME"

    # Update HOSTNAME environment variable for current session
    export HOSTNAME="$DESIRED_HOSTNAME"

    echo "Hostname updated successfully."
else
    echo "Desired Hostname is already correctly set."
fi

# Verify update
echo "Verified hostname: $(hostname)"

sudo apt update -y && \
sudo apt install -y software-properties-common && \
sudo apt install -y sshpass ansible && \
echo "Show asnsible --version" && ansible --version
echo "Show which library ansible is in" && which ansible
