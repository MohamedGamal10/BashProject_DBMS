#!/bin/bash

DB_ROOT="./databases"

function create_table {
	db_name=$1
	
	#Read Table Name
	read -p "Enter table name: " table_name

	#check name to be only characters and no numbers and special character
	if [[ ! "$table_name" =~ ^[a-zA-Z]+$ ]]; then
		echo " "
		echo "##########################################################################"
		echo "Table name must contain only letters and no special characters or numbers."
		echo "##########################################################################"
		database_menu "$db_name"
	fi

	#check if table already exist
	table_dir="$DB_ROOT/$db_name/$table_name"
	if [ -d "$table_dir" ]; then
		echo "###################################"
		echo "Table '$table_name' already exists."
		echo "###################################"
		database_menu "$db_name"
	fi

	#Create table Dir
	mkdir -p "$table_dir"

	#Ask for Number of columns
	read -p "Enter the number of columns: " num_columns
	columns=""
	

	#Loop to enter column name and type
	 for (( i=1; i<=num_columns; i++ ))
	 do
		 #Enter Column name and type
		 read -p "Enter name for column $i: " col_name
		 read -p "Enter type for column $i (int, string, auto_increment): " col_type

		 if [[ ! "$col_name" =~ ^[a-zA-Z_]+$ ]]; then
			 echo " "
			 echo "########################################################################################"
			 echo "Invalid column name '$col_name'. Column names must contain only letters and underscores."
			 echo "########################################################################################"
			 echo " "
			 
			 database_menu "$db_name"
		 fi

		 if [[ ! "$col_type" =~ ^(int|string|auto_increment)$ ]]; then
			 echo " "
			 echo "###################################################################################"
			 echo "Invalid column type '$col_type'. Allowed types are int, string, and auto_increment."
			 echo "###################################################################################"
			 echo " "	 
	
			 database_menu "$db_name"
		 fi
		
		 #Add inserstion to columns variable
		 columns+="$col_name:$col_type,"
		
	 done

	#Remove last comma to be read in meta file
	columns="${columns%,}" #Remove pattern ',' from variable

	#Create Meta,data File
	echo "$columns" > "$table_dir/$table_name.meta"
	touch "$table_dir/$table_name.data"
	echo " "
	echo "##################################################"
	echo "Table '$table_name' created with columns: $columns"
	echo "##################################################"
	echo " "

	
	#Return to database menu
        database_menu "$db_name" 
}
