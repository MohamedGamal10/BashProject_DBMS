#! /bin/bash

DB_ROOT="../databases"

# Create Database
function create_db {
    
    #Read Database Name
    read -p "Enter database name: " db_name
    #Check if there special chracter
    while true
    #Check if there a capital letters
    #Check if database name already exist
    if [ -d "$DB_ROOT/$db_name" ]; then
	echo " "
        echo "###################################"
	echo "Database '$db_name' already exists."
	echo "###################################"
  
    #Create Database
     else
        mkdir -p "$DB_ROOT/$db_name"
        echo " "
        echo "###################################"
	echo "Database '$db_name' created."
        echo "###################################"
    fi
}
