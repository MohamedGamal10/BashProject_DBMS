#! /bin/bash

DB_ROOT="../databases"

# Create Database
function drop_db {

      #Read Database Name
      read -p "Enter Database Name or type back : " db_name

      #Check if user want to back menu
      if [[ "$db_name" == "back" ]]; then
         return
      fi
      
      #Delete DB
      if [ -d "$DB_ROOT/$db_name" ]; then
         rm -rf "$DB_ROOT/$db_name"
	 echo " "
	 echo "############################"
         echo "Database '$db_name' dropped."
	 echo "############################"
    
      else
        echo "###################################"
        echo "Database '$db_name' does not exist."
	echo "###################################"
      fi
}
