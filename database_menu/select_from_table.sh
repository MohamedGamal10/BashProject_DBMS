#!/bin/bash

DB_ROOT="./databases"

function select_from_table {
	db_name=$1
        
	read -p "Enter table name: " table_name
	
    	meta_file="$DB_ROOT/$db_name/$table_name/$table_name.meta"
    	data_file="$DB_ROOT/$db_name/$table_name/$table_name.data"

	if [ ! -f "$meta_file" ]; then
        	echo "Table '$table_name' does not exist."
        	database_menu "$db_name"
        	return
    	fi

	column_name=$(awk -F,  '{print $2}' "$meta_file" | cut -d: -f1)
	read -p "Enter $column_name : " value

	selection=$(grep "$value" "$data_file")
	
	if [ -n "$selection" ]; then
    		echo "$selection"
		echo "====================================="
		echo "|$selection|"
		echo "====================================="
	else
    		echo "empty Data"
	fi

	database_menu "$db_name"


}
