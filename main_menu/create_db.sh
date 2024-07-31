#! /bin/bash

DB_ROOT="../databases"

# Create Database
function create_db {

    while true
    do
      #Read Database Name
      read -p "Enter Database Name or type back : " db_name

      #Check if user want to back menu
      if [[ "$db_name" == "back" ]]; then
         return
      fi

      #Check if there special chracter
      if [[ ! "$db_name" =~ ^[a-z]+$ ]]; then
	  echo " "
          echo "######################################################################"
	  echo "Database Name must be lowercase without numbers and special characters"
	  echo "######################################################################"
          echo " "

      #Check if database name already exist
      elif [ -d "$DB_ROOT/$db_name" ]; then
	  echo " "
          echo "###################################"
	  echo "Database '$db_name' already exists."
	  echo "###################################"
          echo " "
      
      else
	  break
      
      fi
    
    done

    #Create Database
    mkdir -p "$DB_ROOT/$db_name"
    echo " "
    echo "############################"
    echo "Database '$db_name' created."
    echo "############################"
    echo " "
}
