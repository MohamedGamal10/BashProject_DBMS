#! /bin/bash

DB_ROOT="../databases"

function list_db {
     
    #List Databases
    echo "========================================"
    echo "| Database_Name           Creation_Time|"
    echo "========================================"

    if [ -d "$DB_ROOT" ]; then
        while IFS= read -r line; do
            db_name=$(echo "$line" | awk '{print $9}')
            creation_time=$(echo "$line" | awk '{print $6, $7, $8}')
            if [[ -n "$db_name" ]]; then
                echo "| $db_name                   $creation_time|"
            fi
        done < <(ls -l "$DB_ROOT" | tail -n +2)
    else
        echo "| No databases found.                   |"
    fi

    echo "========================================"
}
