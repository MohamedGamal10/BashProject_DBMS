#! /bin/bash

DB_ROOT="../databases"

# Create Database
function create_db {
    
    read -p "Enter database name: " db_name
    if [ -d "$DB_ROOT/$db_name" ]; then
	echo " "
        echo "###################################"
	echo "Database '$db_name' already exists."
	echo "###################################"
    else
        mkdir -p "$DB_ROOT/$db_name"
        echo " "
        echo "###################################"
	echo "Database '$db_name' created."
        echo "###################################"
    fi
}
