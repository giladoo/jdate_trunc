#!/bin/bash

# Check if a database name is provided
if [ -z "$1" ]; then
    echo "\n  Missing argument; you need to provide database name too:\n  $0 <database_name>\n"
    exit 1
fi

# Get the database name from the first argument
DB_NAME=$1
EXTENSION_NAME="jdate_trunc"

# Install the extension in the specified database
echo "Installing [ $EXTENSION_NAME ] in database [ $DB_NAME ] ..."

 psql -d "$DB_NAME" -c "DROP EXTENSION IF EXISTS $EXTENSION_NAME;"
 psql -d "$DB_NAME" -c "CREATE EXTENSION IF NOT EXISTS $EXTENSION_NAME;"

if [ $? -eq 0 ]; then
    echo "Extension $EXTENSION_NAME installed SUCCESSFULLY in $DB_NAME."
else
    echo "FAILED to install extension $EXTENSION_NAME in $DB_NAME."
fi
