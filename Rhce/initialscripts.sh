wget http://localhost/Rhce/inventory    > /dev/null 2>&1
wget http://localhost/Rhce/ansible.cfg  > /dev/null 2>&1
mkdir collections
ansible-galaxy collection install  http://localhost/Rhce/ansible-posix-1.4.0.tar.gz -p collections
ansible-galaxy collection install  http://localhost/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -p collections
ansible-galaxy collection install  http://localhost/Rhce/community-general-7.3.0.tar.gz -p collections
wget http://localhost/Rhce/admin.yml       > /dev/null 2>&1
ansible-playbook admin.yml      > /dev/null 2>&1
