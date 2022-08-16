#!/bin/bash

PATH=$PATH:/usr/local/bin

USER=root
PASS=mySQL!@#456
DEST=/home/tw4/
TIME=$(date +"%Y%m%d")

 
for DB in `mysql --skip-column-names -u $USER -p$PASS -e "SHOW DATABASES LIKE 'world';"`
	do
	for TBL in `mysql --skip-column-names -u $USER -p$PASS -e "SHOW TABLES FROM $DB;"`
		do
	        mkdir $DEST/$DB;
		mysqldump --master-data=2 -u$USER -p$PASS $DB $TBL > $DEST/$DB/$TBL-$TIME.sql;
		done
	done
