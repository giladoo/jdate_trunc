#!/bin/bash

EXTENSION_NAME="jdate_trunc"
PG_VERSION=$(psql -t -c "SHOW server_version_num;" | xargs | cut -c 1-2)  # Get major version
echo $PG_VERSION
EXTENSION_DIR="/usr/share/postgresql/$PG_VERSION/extension"
echo $EXTENSION_DIR
if [ ! -d "$EXTENSION_DIR" ]; then
    echo "Extension directory not found: $EXTENSION_DIR"
    exit 1
fi

echo "Copying extension files to $EXTENSION_DIR..."
# TODO: DROP the old extension from database
# TODO: Remove old files from EXTENSION_DIR
cp "$EXTENSION_NAME.control" "$EXTENSION_DIR"
cp "$EXTENSION_NAME--1.2.sql" "$EXTENSION_DIR"

echo "Installing the extension in your database..."
#sudo -u postgres psql -c "CREATE EXTENSION $EXTENSION_NAME;"

echo "Extension installed successfully!"
