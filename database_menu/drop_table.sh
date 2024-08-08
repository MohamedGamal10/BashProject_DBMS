#!/bin/bash

DB_ROOT="./databases"

function drop_table {
	
	db_name=$1
	
	read -p "Enter table name: " table_name

	table_path="$DB_ROOT/$db_name/$table_name"
	
	if [ ! -d "$table_path" ]; then
		echo " "
		echo "###################################"
        	echo "Table '$table_name' does not exist."
		echo "###################################"
		echo " "
    	else
		rm -rf "$table_path"
		echo " "
		echo "############################"
		echo "Table '$table_name' dropped."
		echo "############################"
		echo " "
	
	fi
  
    	database_menu "$db_name"
}
