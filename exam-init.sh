#/bin/bash

tar -xvf Rhce.tar  > /dev/null 2>&1

echo -ne '#####                      (33%)\r'

dnf install httpd -y     > /dev/null 2>&1
systemctl enable --now  httpd   > /dev/null 2>&1
systemctl disable --now  firewalld   > /dev/null 2>&1

echo -ne '##############             (50%)\r'

cp -rf Rhce  /var/www/html/Rhce     > /dev/null 2>&1
mkdir /var/www/html/Rhce/redhat-rhel_system_roles     > /dev/null 2>&1
tar -zxf /var/www/html/Rhce/redhat-rhel_system_roles-1.0.0.tar.gz -C /var/www/html/Rhce/redhat-rhel_system_roles/    > /dev/null 2>&1
systemctl  restart httpd   > /dev/null 2>&1
echo -ne '###########################(100%)\n'
