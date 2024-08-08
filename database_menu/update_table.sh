#!/bin/bash

DB_ROOT="./databases"

function update_table {

	db_name=$1
	
	read -p "Enter table name: " table_name

        meta_file="$DB_ROOT/$db_name/$table_name/$table_name.meta"
        data_file="$DB_ROOT/$db_name/$table_name/$table_name.data"


        if [ ! -f "$meta_file" ]; then
                echo "Table '$table_name' does not exist."
                database_menu "$db_name"
                return
        fi
	
	#Delete Old Value and insert new value

        column_name=$(awk -F, '{print $2}' "$meta_file" | cut -d: -f1)
        read -p "Enter value for $column_name to update rows: " value

        selection=$(grep "$value" "$data_file")

        if [ -n "$selection" ]; then
                grep -v "$value" "$data_file" > "${data_file}.tmp" && mv "${data_file}.tmp" "$data_file"
		
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

        	flag=0

        	for ((i=2;i<=$columns_num;i++));
        	do
                	echo "$column_num"
                	column_name=$(awk -F, -v col="$i" '{print $col}' "$meta_file" | cut -d: -f1)
                	column_type=$(awk -F, -v col="$i" '{print $col}' "$meta_file" | cut -d: -f2)

                	read -p "Enter $column_name ($column_type) : " value

                	if [ "$column_type" == "int" ]; then
                        	if [[ "$value" =~ ^[0-9]+$ ]]; then
                                 	row+="$value,"
                        	else
                                	echo "Invalid input: $value is not an integer."
                                	flag=1
                        	fi

                	elif [ "$column_type" == "string" ]; then
                        	if [[ "$value" =~ ^[a-zA-Z]+$ ]]; then
                                	row+="$value,"

                        	else
                                	echo "Invalid input: $value should only contain letters."
                                	flag=1
                        	fi
                	
			else
                        	echo "Unknown type"
                        	flag=1

                	fi

        	done

        	#Insert Data to file
        	if [ $flag -eq 1 ]; then
                	echo "Row Not update."
        	else
                	echo "${row%,}" >> "$data_file"
                	echo "Row updated."
        	fi


        	#Return
        	database_menu "$db_name"
	else
		echo "Rows not found to do successful update"
		database_menu "$db_name"
	fi

}
