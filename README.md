# public
public share
BeaglePlay with debian:latest
user ansible
hostname Ansible-Con-troller

#Step000_Install_ansible.*
## install ansible
```
curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step000_Install_ansible.sh | bash
```
## setup ansible playbook
```
curl -sSL https://raw.githubusercontent.com/tcbquick/public/main/Step010_Setup_ansible.sh | bash
```


# Advanced Ansible best practices methods
## ansible.cfg

## ssh-keys

## inventory

## imports

## includes

## vars

## tasks

## roles
### defaults
### handlers
### tasks
### templates
### vars

```
ansible-project/
├── inventories/
│   └── hosts.ini
├── host_vars/
│   ├── server1.yml
│   └── server2.yml
├── roles/
│   └── webserver/
│       ├── tasks/
│       │   └── main.yml
│       ├── handlers/
│       │   └── main.yml
│       ├── templates/
│       │   └── nginx.conf.j2
│       └── defaults/
│           └── main.yml
└── site.yml

```
