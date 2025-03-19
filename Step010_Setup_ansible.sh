#!/bin/bash
echo "curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step010_Setup_ansible.sh | bash"
curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step010_Setup_ansible.yaml > /etc/ansible/Step010_Setup_ansible.yaml
ansible-playbook -i localhost, /etc/ansible/Step010_setup_ansible.yaml
