#!/bin/bash

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
        1) echo "create_database" ;;
        2) echo "list_databases" ;;
        3) echo "connect_database" ;;
        4) echo "drop_database" ;;
        5) exit 0 ;;
        *) echo "Invalid option"; main_menu ;;
    esac
}

# Start
while true
do
  main_menu
done
