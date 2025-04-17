Here's a comprehensive set of example Ansible ad-hoc commands covering common use cases to help you practice and gain confidence:

---

### 🔹 **Basic Ansible Ad-hoc Commands**

**Ping all hosts to check connectivity:**
```bash
ansible all -m ping
```

**Gather facts from all hosts:**
```bash
ansible all -m setup
```

---

### 📂 **File Management**

**Create a directory on all hosts:**
```bash
ansible webservers -m file -a "path=/var/www/html state=directory mode=0755"
```

**Create an empty file:**
```bash
ansible webservers -m file -a "path=/tmp/example.txt state=touch mode=0644"
```

**Delete a file:**
```bash
ansible dbservers -m file -a "path=/tmp/oldfile.log state=absent"
```

---

### ⚙️ **Package Management**

**Install a package using apt (Debian/Ubuntu):**
```bash
ansible webservers -m apt -a "name=nginx state=present update_cache=yes" --become
```

**Install a package using yum/dnf (CentOS/RHEL):**
```bash
ansible appservers -m yum -a "name=httpd state=latest" --become
```

**Remove a package:**
```bash
ansible dbservers -m apt -a "name=mysql-server state=absent purge=yes autoremove=yes" --become
```

---

### 🚀 **Service Management**

**Start a service:**
```bash
ansible webservers -m service -a "name=nginx state=started enabled=yes" --become
```

**Stop and disable a service:**
```bash
ansible appservers -m service -a "name=httpd state=stopped enabled=no" --become
```

**Restart a service:**
```bash
ansible dbservers -m service -a "name=mysql state=restarted" --become
```

---

### 📃 **File Transfers**

**Copy a local file to hosts:**
```bash
ansible webservers -m copy -a "src=./index.html dest=/var/www/html/index.html mode=0644" --become
```

**Copy a file from host to control node (fetch):**
```bash
ansible dbservers -m fetch -a "src=/etc/mysql/my.cnf dest=./backup/{{inventory_hostname}}_my.cnf flat=yes"
```

---

### 🛠️ **Execute Shell Commands**

**Run a command on hosts:**
```bash
ansible all -m command -a "uptime"
```

**Run a shell pipeline (requires shell module):**
```bash
ansible all -m shell -a "df -h | grep /dev/sd"
```

---

### 🔐 **User Management**

**Create a new user:**
```bash
ansible all -m user -a "name=ansible_user state=present groups=sudo append=yes" --become
```

**Delete a user:**
```bash
ansible all -m user -a "name=temp_user state=absent remove=yes" --become
```

---

### 🔎 **System Information**

**Check disk space:**
```bash
ansible all -m command -a "df -h"
```

**Check memory usage:**
```bash
ansible all -m shell -a "free -m"
```

---

### 📑 **Editing Remote Files**

**Add a line to a file if it doesn't exist:**
```bash
ansible webservers -m lineinfile -a "path=/etc/hosts line='192.168.0.50  myhost.localdomain' state=present" --become
```

**Replace text in a file:**
```bash
ansible appservers -m replace -a "path=/etc/ssh/sshd_config regexp='^#?PermitRootLogin .*' replace='PermitRootLogin no'" --become
```

---

### 🕒 **Cron Jobs**

**Create a cron job:**
```bash
ansible dbservers -m cron -a "name='Backup database' minute='0' hour='2' job='/usr/local/bin/backup.sh'" --become
```

**Remove a cron job:**
```bash
ansible dbservers -m cron -a "name='Backup database' state=absent" --become
```

---

### 🖥️ **System Reboot/Shutdown**

**Reboot hosts immediately:**
```bash
ansible all -m reboot --become
```

**Shutdown hosts immediately:**
```bash
ansible dbservers -m command -a "shutdown -h now" --become
```

---

### 🗝️ **Managing SSH Keys**

**Add authorized SSH keys:**
```bash
ansible all -m authorized_key -a "user=ansible_user state=present key='{{ lookup('file', '~/.ssh/id_rsa.pub') }}'" --become
```

---

### 📥 **Downloading Remote Files**

**Download a file from the internet to remote hosts:**
```bash
ansible webservers -m get_url -a "url=https://example.com/file.tar.gz dest=/tmp/file.tar.gz mode=0644"
```

---

### 🎛️ **SELinux Management (RHEL/CentOS)**

**Set SELinux to permissive mode temporarily:**
```bash
ansible all -m selinux -a "policy=targeted state=permissive" --become
```

**Disable SELinux permanently:**
```bash
ansible all -m selinux -a "state=disabled" --become
```

---

### 🚦 **Firewall Management**

**Open firewall port (firewalld):**
```bash
ansible webservers -m firewalld -a "port=80/tcp permanent=yes state=enabled immediate=yes" --become
```

---

### 📡 **Networking**

**Test network connectivity (ICMP):**
```bash
ansible all -m command -a "ping -c 4 8.8.8.8"
```

**Check open ports on hosts:**
```bash
ansible all -m shell -a "ss -tulnp"
```

---

### 📀 **Disk Management**

**Mount a filesystem:**
```bash
ansible all -m mount -a "src=/dev/sdb1 path=/mnt/data fstype=ext4 state=mounted" --become
```

**Unmount a filesystem:**
```bash
ansible all -m mount -a "path=/mnt/data state=unmounted" --become
```

---

### 💾 **Backup Remote Filesystem**

**Create remote backup archive:**
```bash
ansible dbservers -m archive -a "path=/var/lib/mysql dest=/tmp/mysql_backup.tar.gz format=gz" --become
```

---

**Practice these ad-hoc commands regularly to enhance your Ansible skills and prepare for writing more complex playbooks!**
