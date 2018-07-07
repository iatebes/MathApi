#!/bin/bash

# tao DB voi tham so tu bien moi truong
mysql -e "CREATE DATABASE $DB_NAME /*\!40100 DEFAULT CHARACTER SET $DB_CHARSET */;"
echo "Created DB $DB_NAME"
mysql -e "CREATE USER $DB_USER@localhost IDENTIFIED BY '$DB_PASS';"
echo "Created User $DB_USER"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
echo "Granted all privileges"
mysql -e "FLUSH PRIVILEGES;"
echo "Flushed"
mysql -e "create table list_catalog (id int, name varchar(255));" $DB_NAME
echo "Created table list_catalog"

# khoi tao du lieu
mysql -e "insert into list_catalog values(1, 'danh muc 1');" $DB_NAME
mysql -e "insert into list_catalog values(2, 'danh muc 2');" $DB_NAME
echo "Inserted data"
