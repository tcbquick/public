# Include files at run time (dynamic)
Perfect — here's an extended example using `include_tasks` **dynamically**, with conditionals and looping.

---

### 📁 Updated Directory Structure

```bash
my-ansible-project/
├── main.yml
└── tasks/
    ├── install_nginx.yml
    ├── install_apache.yml
    └── harden_firewall.yml
```

---

### 📜 `main.yml` (with conditional includes)

```yaml
---
- name: Conditional Task Inclusion with include_tasks
  hosts: all
  become: yes
  vars:
    web_server: nginx  # Change to "apache" to include Apache tasks
    enable_firewall: true

  tasks:
    - name: Dynamically include nginx tasks
      include_tasks: tasks/install_nginx.yml
      when: web_server == "nginx"

    - name: Dynamically include apache tasks
      include_tasks: tasks/install_apache.yml
      when: web_server == "apache"

    - name: Include firewall hardening if enabled
      include_tasks: tasks/harden_firewall.yml
      when: enable_firewall
```

---

### 📜 `tasks/install_nginx.yml`

```yaml
---
- name: Install NGINX
  apt:
    name: nginx
    state: present
    update_cache: yes

- name: Start and enable NGINX
  service:
    name: nginx
    state: started
    enabled: yes
```

---

### 📜 `tasks/install_apache.yml`

```yaml
---
- name: Install Apache
  apt:
    name: apache2
    state: present
    update_cache: yes

- name: Start and enable Apache
  service:
    name: apache2
    state: started
    enabled: yes
```

---

### 📜 `tasks/harden_firewall.yml`

```yaml
---
- name: Ensure UFW is installed
  apt:
    name: ufw
    state: present

- name: Allow SSH
  ufw:
    rule: allow
    name: OpenSSH

- name: Allow HTTP and HTTPS
  ufw:
    rule: allow
    port: "{{ item }}"
  loop:
    - 80
    - 443

- name: Enable UFW
  ufw:
    state: enabled
    policy: deny
```

---

Want to see this written using `roles` instead of include files? Or with `tags` for fine-grained execution?
