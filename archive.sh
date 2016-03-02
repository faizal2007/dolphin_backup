#!/bin/bash

##
#
#    @package archive.sh
#    @desc
#         + Archive all backup file
#
##

## This script require root access

## Initiate Basic variable
DIR="$(dirname $0)"
CONF="$DIR/conf"
BACKUP_FOLD="$DIR/backup"
ARCHIVE_FOLD="$DIR/archives"

# start moving backup file to archive folder 
if [ -d "$BACKUP_FOLD" ]; then
	[ -d "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)" ] || mkdir -p "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)"
	cp -Rv $BACKUP_FOLD/* "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)/"
else
	echo "Backup folder doesn't exist"
	echo "Start doing fresh backup .."
	$DIR/adhoc.sh
fi
