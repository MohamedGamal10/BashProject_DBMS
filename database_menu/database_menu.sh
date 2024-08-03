#!/bin/bash

source ./database_menu/create_table.sh
source ./database_menu/list_tables.sh
source ./database_menu/drop_table.sh
source ./database_menu/insert_into_table.sh
source ./database_menu/select_from_table.sh
source ./database_menu/delete_from_table.sh
source ./database_menu/update_table.sh
source ../main.sh

function database_menu {

	db_name=$1
	echo " "
	echo "################################"
	echo "Connected to database '$db_name'"
	echo "################################"
	echo " "
	echo "1. Create Table"
	echo "2. List Tables"
	echo "3. Drop Table"
	echo "4. Insert into Table"
        echo "5. Select from Table"
        echo "6. Delete from Table"
	echo "7. Update Table"
	echo "8. Back to Main Menu"
	read -p "Choose an option: " option

	case $option in

	        1) create_table "$db_name" ;;
		2) list_tables "$db_name" ;;
	        3) drop_table "$db_name" ;;
		4) insert_into_table "$db_name" ;;
		5) select_from_table "$db_name" ;;
		6) delete_from_table "$db_name" ;;
		7) update_table "$db_name" ;;
		8) main_menu ;;
		*) echo "Invalid option"; database_menu "$db_name" ;;
	esac

}
