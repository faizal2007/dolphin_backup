#!/bin/bash

source lib.sh

if [ -d "$BACKUP_FOLD/" ] && [ "$(ls -A $BACKUP_FOLD)" ] 
then
    echo "Db restoration start..."
    restore_db
    echo "Db restoration completed."
else
    echo "$BACKUP_FOLD/ folder not exist or empty."
fi
