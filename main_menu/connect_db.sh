#! /bin/bash

source ./database_menu/database_menu.sh

DB_ROOT="../databases"

function connect_db {
	list_db
	read -p "Enter database name: " db_name
	
	if [ -d "$DB_ROOT/$db_name" ]; then
                database_menu "$db_name"
        else
		echo " "
		echo "###################################"
		echo "Database '$db_name' does not exist."
		echo "###################################"
		echo " "
		return
	fi

}
