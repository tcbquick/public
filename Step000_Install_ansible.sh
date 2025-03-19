#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step000_Install_ansible.sh | bash"
sudo apt update -y && \
sudo apt install -y software-properties-common && \
sudo apt install -y ansible && \
sudo mkdir /etc/ansible \
ansible --version

