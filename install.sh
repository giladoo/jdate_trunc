#!/bin/bash

EXTENSION_NAME="jdate_trunc"
PG_VERSION=$(psql -t -c "SHOW server_version_num;" | xargs | cut -c 1-2)  # Get major version
EXTENSION_DIR="/usr/share/postgresql/$PG_VERSION/extension"

if [ ! -d "$EXTENSION_DIR" ]; then
    echo "Extension directory not found: $EXTENSION_DIR"
    exit 1
fi

echo "Copying extension files to $EXTENSION_DIR..."
sudo cp "$EXTENSION_NAME/$EXTENSION_NAME.control" "$EXTENSION_DIR"
sudo cp "$EXTENSION_NAME/$EXTENSION_NAME--1.0.sql" "$EXTENSION_DIR"

echo "Installing the extension in your database..."
psql -c "CREATE EXTENSION $EXTENSION_NAME;"

echo "Extension installed successfully!"
