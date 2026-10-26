#/bin/bash

tar -xvf Rhce.tar  > /dev/null 2>&1

echo -ne '#####                      (33%)\r'

dnf install httpd -y     > /dev/null 2>&1
systemctl enable --now  httpd   > /dev/null 2>&1
systemctl disable --now  firewalld   > /dev/null 2>&1

curl -X POST "http://utility.lab.example.com:3000/api/v1/user/repos"   -u "student:Student@123"   -H "Content-Type: application/json"   -d '{"name": "ansible", "private": false}'   > /dev/null 2>&1
ssh student@workstation "git clone http://student:Student%40123@utility.lab.example.com:3000/student/ansible.git"  > /dev/null 2>&1

echo -ne '##############             (50%)\r'

cp -rf Rhce  /var/www/html/Rhce     > /dev/null 2>&1
mkdir /var/www/html/Rhce/redhat-rhel_system_roles     > /dev/null 2>&1
tar -zxf /var/www/html/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -C /var/www/html/Rhce/redhat-rhel_system_roles/    > /dev/null 2>&1
systemctl  restart httpd   > /dev/null 2>&1
ansible-galaxy collection install http://localhost/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -p /usr/share/ansible/collections/ > /dev/null 2>&1
wget  http://localhost/Rhce/initialscripts.sh    > /dev/null 2>&1
sh initialscripts.sh > /dev/null 2>&1
echo -ne '###########################(100%)\n'
