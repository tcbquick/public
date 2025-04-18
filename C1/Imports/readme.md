# Import files at parse time (static)
Sure! Here's a simple but clear example of an Ansible playbook that uses **include files** (`include_tasks` or `import_tasks`) to modularize the playbook into smaller, more manageable files.

---

### 📁 Directory Structure

```bash
my-ansible-project/
├── main.yml
└── tasks/
    ├── install_packages.yml
    ├── configure_service.yml
    └── start_service.yml
```

---

### 📜 `main.yml` (The main playbook)

```yaml
---
- name: Example Playbook Using Includes
  hosts: all
  become: yes

  tasks:
    - name: Include install tasks
      import_tasks: tasks/install_packages.yml

    - name: Include configuration tasks
      import_tasks: tasks/configure_service.yml

    - name: Include service start tasks
      import_tasks: tasks/start_service.yml
```

> 💡 Use `import_tasks` when you want the tasks to be included **at playbook parse time** (static).  
> Use `include_tasks` when the inclusion should happen **at runtime** (dynamic, can be conditional).

---

### 📜 `tasks/install_packages.yml`

```yaml
---
- name: Install NGINX
  apt:
    name: nginx
    state: present
    update_cache: yes
```

---

### 📜 `tasks/configure_service.yml`

```yaml
---
- name: Copy NGINX config file
  template:
    src: nginx.conf.j2
    dest: /etc/nginx/nginx.conf
    mode: '0644'
  notify: Restart nginx
```

---

### 📜 `tasks/start_service.yml`

```yaml
---
- name: Ensure NGINX is started and enabled
  service:
    name: nginx
    state: started
    enabled: yes
```

---

### Optional: Add a Handler (in `main.yml`)

```yaml
  handlers:
    - name: Restart nginx
      service:
        name: nginx
        state: restarted
```

---

Want an example using `include_tasks` with `when` conditionals or loops?
