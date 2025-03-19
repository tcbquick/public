#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/home/#Step000_Install_ansible.sh | bash"
sudo apt update -y && \
sudo apt install -y software-properties-common && \
sudo add-apt-repository --yes --update ppa:ansible/ansible && \
sudo apt install -y ansible && \
ansible --version
