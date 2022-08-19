# Ansible role: Otus
installs and configures NGINX as a reverse proxy, MySQL Master-slave Replication, Monitoring System Grafana-Prometheus and ELK stack on CentOS7.
# Requirements:
CentOS 7 with installed epel-release repo on remote hosts.
# Hosts:
Create your hosts file. For databases mysql_replication_role should be stated.
```
[web_server]
web ansible_host=192.168.88.115

[mysql]
master ansible_host=192.168.88.116 mysql_replication_role=master
slave ansible_host=192.168.88.117 mysql_replication_role=slave
```
# Role variables:
db_servers role requires to define following variables in /roles/db_servers/vars/main.yml file:  
```
mysql_root_password:  root_password  
mysql_user: user_name  
mysql_user_password: user_password  
```
# Files:
Change default index page in Apache web servers by changing /roles/web_server/files/www/html/index.html file.
# Run playbook:
This playbook requires root access, so run it with global "become: yes" in your main.yml.
