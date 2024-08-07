#!/bin/bash

DB_ROOT="./databases"

function insert_into_table {

	db_name=$1
        read -p "Enter table name: " table_name
	
	#Read files
	meta_file="$DB_ROOT/$db_name/$table_name/$table_name.meta"
	data_file="$DB_ROOT/$db_name/$table_name/$table_name.data"
	
	#check table exist or not
	if [ ! -f "$meta_file" ]; then
		echo "Table '$table_name' does not exist."
		database_menu "$db_name"
	fi

	#Get Number of columns
	columns_num=$(awk -F, '{print NF}' "$meta_file")
	
	#Get value of next id
	last_value=$(tail -n 1 "$data_file" | cut -d',' -f1)
	if [ -z "$last_value" ]; then
		last_value=0
	else
		last_value=$((last_value + 1))
	fi
	
	#Get type of columns and get value from user
	id=$last_value
	row+="$id,"
	for i in {2..$columns_num}; 
	do
		column_name=$(awk -F, -v col="$i" '{print $col}' "$meta_file" | cut -d: -f1)
		column_type=$(awk -F, -v col="$i" '{print $col}' "$meta_file" | cut -d: -f2)
			
		read -p "Enter $column_name ($column_type) : " value

		if [ "$column_type" == "int" ]; then
			if [[ "$value" =~ ^[0-9]+$ ]]; then
				 row+="$value,"
				 break
			else
				echo "Invalid input: $value is not an integer."
			fi
                 
		elif [ "$column_type" == "string" ]; then
			if [[ "$value" =~ ^[a-zA-Z]+$ ]]; then
				row+="$value,"
				break
			else
				echo "Invalid input: $value should only contain letters."
			fi
		else
			echo "Unknown type"
			break
		fi

	done

	#Insert Data to file
	echo "${row%,}" >> "$data_file"
	echo "Row inserted."


	#Return
	database_menu "$db_name"
}
