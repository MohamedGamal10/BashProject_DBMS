#! /bin/bash

DB_ROOT="../databases"

function list_db {
     
     #List Databases
     echo "========================================"
     echo "|Database_Name            Creation_Time|"
     echo "========================================"
     echo "$(ls -l $DB_ROOT | awk '{print $9}')"
     
}
