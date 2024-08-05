#!/bin/bash

DB_ROOT="./databases"

function list_tables {

    db_name=$1

    table_dir="$DB_ROOT/$db_name"

    echo "===================================================="
    echo "| Table Name          | Column Name      | Type     |"
    echo "===================================================="

    found_tables=false

    # Loop through each directory within the database directory

    for table_dir in "$table_dir"/*/; do
        if [ -d "$table_dir" ]; then
            table_name=$(basename "$table_dir")
            meta_file="$table_dir/$table_name.meta"
            if [ -f "$meta_file" ]; then
                found_tables=true
                columns=$(cat "$meta_file")
                IFS=',' read -ra columns_array <<< "$columns"
                for col in "${columns_array[@]}"; do
                    IFS=':' read -ra col_parts <<< "$col"
                    col_name="${col_parts[0]}"
                    col_type="${col_parts[1]}"
                    echo "| $table_name          | $col_name       | $col_type     |"
                done
                echo "----------------------------------------------------"
            fi
        fi
    done

    if [ "$found_tables" = false ]; then
        echo " "
        echo "#######################################"
        echo "No tables found in database '$db_name'."
        echo "#######################################"
        echo " "
        database_menu "$db_name"
    fi


}
