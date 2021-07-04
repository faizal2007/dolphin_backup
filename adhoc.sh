#!/bin/bash

##
#
#    @package adhoc.sh
#    @desc
#         + Backup all db except ignore.list
#
##

## This script require root access

source lib.sh

# check require folder if not exist create new
if [ ! -d "$BACKUP_FOLD/" ]; then
    mkdir -p "$BACKUP_FOLD/"
    if [ $? -eq 0 ]; then 
        echo -e "Folder $PWD/backup/ successfully created."
        backup
    fi
else
    backup
fi


