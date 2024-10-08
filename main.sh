#!/bin/bash
# Source Modules
source ./main_menu/create_db.sh
source ./main_menu/list_db.sh
source ./main_menu/drop_db.sh
source ./main_menu/connect_db.sh

#Check Databases Dir if not found create one
DB_ROOT="./databases"
mkdir -p $DB_ROOT

#Display the Main Menu
function main_menu {
    echo " "
    echo "###### Main Menu ######"
    echo "1. Create Database"
    echo "2. List Databases"
    echo "3. Connect to Database"
    echo "4. Drop Database"
    echo "5. Exit"
    read -p "Choose an option: " option

    case $option in
        1) create_db ;;
        2) list_db ;;
        3) connect_db ;;
        4) drop_db ;;
        5) exit 0 ;;
        *) echo "Invalid option"; main_menu ;;
    esac
}

# Start
while true
do
  main_menu
done
