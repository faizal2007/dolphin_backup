#!/bin/bash

##
#
#    @package adhoc.sh
#    @desc
#         + Backup all db except ignore.list
#
##

## This script require root access

## Initiate Basic variable
DIR="$(dirname $0)"
CONF="$DIR/conf"
BACKUP_FOLD="$DIR/backup"
BIN="/usr/bin"

TMP=$(mktemp -d -t tmp.XXXXXXXXXX)

## function to clear tmp file after task completed
function finish() {
    rm -rf "$TMP"
}
trap finish EXIT

## function to create backup
function backup() {
    echo -e "Start doing backup ..."
    $BIN/mysql --defaults-file="$CONF/my.cnf" --batch --skip-column-names -e "show databases" | grep -v -f "$CONF/ignore.list" > "$TMP/db.list"

    for db in `cat $TMP/db.list`; do $BIN/mysqldump --defaults-file="$CONF/my.cnf" --events --dump-date $db  > "$BACKUP_FOLD/$db.sql";     
        echo "Dumped $db to $BACKUP_FOLD/$db.sql"; done
    exit
}

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


