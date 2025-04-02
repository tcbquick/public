#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step005_Setup_ansible.sh | bash"
echo "fetch play-book yaml then run it"
curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step005_Setup_ansible.yaml > /home/ansible/Step005_Setup_ansible.yaml
#ansible-playbook -l prod -i /home/ansible/C1/Invetories/hosts.ini --become --ask-become-pass /home/ansible/Step005_Setup_ansible.yaml
ansible-playbook -i "127.0.0.1" --become --ask-become-pass /home/ansible/Step005_Setup_ansible.yaml
