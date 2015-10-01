#!/bin/bash

##
#
#    @package adhoc.sh
#    @desc
#         + Backup all db except ignore.list
#
##

## This script require root access

## function to clear tmp file after task completed
function finish() {
    rm -rf "$TMP"
}
trap finish EXIT

# Temporary dump staging folder
  TMP=$(mktemp -d -t tmp.XXXXXXXXXX)

## function to create backup
function backup() {
    echo -e "Start doing backup ..."
    mysql --defaults-file=conf/my.cnf --batch --skip-column-names -e "show databases" | grep -v -f "conf/ignore.list" > "$TMP/db.list"

    for db in `cat $TMP/db.list`; do mysqldump --defaults-file=conf/my.cnf --events --dump-date $db  > ./backup/$db.sql;     
        echo "Dumped $db"; done
    exit
    echo -e "Backup completed"
}

# check require folder if not exist create new
if [ ! -d "$PWD/backup/" ]; then
    mkdir -p "$PWD/backup/"
    if [ $? -eq 0 ]; then 
        echo -e "Folder $PWD/backup/ successfully created."
        backup
    fi
else
    backup
fi


