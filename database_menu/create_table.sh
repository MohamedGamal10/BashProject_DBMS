#!/bin/bash

source ./database_menu/database_menu.sh

DB_ROOT="./databases"

function create_table {
	db_name=$1
	echo "Create '$db_name'"
        database_menu "$db_name" 
}
