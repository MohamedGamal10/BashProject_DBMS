#!/bin/bash

DB_ROOT="./databases"

function delete_from_table {
	
	db_name=$1
        
	read -p "Enter table name: " table_name

    	meta_file="$DB_ROOT/$db_name/$table_name/$table_name.meta"
    	data_file="$DB_ROOT/$db_name/$table_name/$table_name.data"

    	
    	if [ ! -f "$meta_file" ]; then
        	echo "Table '$table_name' does not exist."
        	database_menu "$db_name"
        	return
    	fi

	column_name=$(awk -F, '{print $2}' "$meta_file" | cut -d: -f1)
    	read -p "Enter value for $column_name to delete rows: " value

    	selection=$(grep "$value" "$data_file")

	if [ -n "$selection" ]; then
        	echo "====================================="
        	echo "|$selection|"
        	echo "====================================="
        	
		read -p "Are you sure you want to delete these rows? (y/n): " confirm

        	if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        
            		grep -v "$value" "$data_file" > "${data_file}.tmp" && mv "${data_file}.tmp" "$data_file"
            		echo "'$value' deleted."
        	else
            		echo "Deletion Error"
        	fi
    	else
        	echo "No data matching '$value' found."
    	fi

    database_menu "$db_name"



}
