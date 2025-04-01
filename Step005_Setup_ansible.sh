#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step005_Setup_ansible.sh | bash"
echo "fetch play-book yaml then run it"
curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step005_Setup_ansible.yaml > /home/ansible/Step005_Setup_ansible.yaml
ansible-playbook -i localhost --become --ask-become-pass /home/ansible/Step005_Setup_ansible.yaml
