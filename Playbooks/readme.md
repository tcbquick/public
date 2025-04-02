# ansible Playbooks
## sample options and parameters
### - l --limit scope
### -i --inventory file name ini or yml format or both if specifying a folder name containing files
### --ask-pass          # ask for password
### --become            # become root/sudo
### --ask-become-pass   # ask for sudo password




Here’s a comprehensive set of example syntax parameters for running Ansible playbooks, covering various useful flags and options:

### Basic Syntax Check
```bash
ansible-playbook site.yml --syntax-check
```

### Run Playbook in Check Mode (Dry-run)
```bash
ansible-playbook site.yml --check
```

### Debugging with Verbosity Levels
Increasing verbosity from basic (`-v`) to maximum (`-vvvv`):

```bash
ansible-playbook site.yml -v
ansible-playbook site.yml -vv
ansible-playbook site.yml -vvv
ansible-playbook site.yml -vvvv
```

### Limit Execution to Specific Hosts or Groups
```bash
ansible-playbook site.yml --limit "webservers"
ansible-playbook site.yml --limit "host1.example.com,host2.example.com"
ansible-playbook site.yml --limit "192.168.0.10"
```

### Specify Inventory File
```bash
ansible-playbook site.yml -i inventory.ini
ansible-playbook site.yml -i inventory/
```

### Prompt for SSH Password
```bash
ansible-playbook site.yml --ask-pass
```

### Prompt for Become Password (sudo Password)
```bash
ansible-playbook site.yml --ask-become-pass
```

### Use Specific User for SSH Connection
```bash
ansible-playbook site.yml -u adminuser
```

### Enable Privilege Escalation (become)
```bash
ansible-playbook site.yml --become
```

### Specify Privilege Escalation Method and User
```bash
ansible-playbook site.yml --become-method=sudo --become-user=root
```

### Tags: Run Tasks Matching Specific Tags
```bash
ansible-playbook site.yml --tags "setup,install"
```

### Skip Tasks Matching Specific Tags
```bash
ansible-playbook site.yml --skip-tags "debug,cleanup"
```

### Extra Variables from Command Line
Inline variables:
```bash
ansible-playbook site.yml --extra-vars "var1=value1 var2=value2"
```

From JSON/YAML file:
```bash
ansible-playbook site.yml --extra-vars "@vars.yml"
ansible-playbook site.yml --extra-vars "@vars.json"
```

### Forks: Control Parallelism
```bash
ansible-playbook site.yml --forks=10
```

### Run Playbook from a Specific Start Task
```bash
ansible-playbook site.yml --start-at-task="Install NGINX"
```

### Set Connection Timeout
```bash
ansible-playbook site.yml --timeout=30
```

### Control SSH Connection Type (smart, paramiko, ssh)
```bash
ansible-playbook site.yml -c ssh
```

### Inventory with Inline Hosts (without Inventory File)
```bash
ansible-playbook site.yml -i "192.168.1.10,192.168.1.11,"
```

### Step-by-Step Interactive Execution
```bash
ansible-playbook site.yml --step
```

### Diff Mode: Show Changes in File Tasks
```bash
ansible-playbook site.yml --diff
```

### Force Handlers to Run, Even on Failure
```bash
ansible-playbook site.yml --force-handlers
```

### Environment Variables (Commonly Used)
```bash
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook site.yml
ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook site.yml
```

---

### Combined Comprehensive Example
Here’s a practical comprehensive example combining multiple parameters:

```bash
ansible-playbook site.yml \
  -i inventory.ini \
  --limit "webservers" \
  --become \
  --ask-become-pass \
  --syntax-check \
  --check \
  -vvvv \
  --extra-vars "env=production debug=true" \
  --tags "setup,deploy" \
  --diff
```

**Explanation of Combined Example:**
- `-i inventory.ini`: Custom inventory file.
- `--limit "webservers"`: Restricts execution to "webservers" group.
- `--become`: Use privilege escalation.
- `--ask-become-pass`: Prompt for become (sudo) password.
- `--syntax-check`: Check YAML syntax without executing.
- `--check`: Dry run mode, simulates execution without making changes.
- `-vvvv`: Maximum verbosity for debugging.
- `--extra-vars`: Passes inline variables.
- `--tags`: Execute tasks with specific tags only.
- `--diff`: Show differences when files are changed.

This collection of examples covers the most common and essential parameters for effectively using Ansible playbooks in real-world scenarios.
