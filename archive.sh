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
COPY=6

# start moving backup file to archive folder 
if [ -d "$BACKUP_FOLD" ]; then
	[ -d "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)" ] || mkdir -p "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)"
	cp -Rv $BACKUP_FOLD/* "$ARCHIVE_FOLD/$(hostname)_$(date +%Y_%m_%d_%0k%M)/"
else
	echo "Backup folder doesn't exist"
	echo "Start doing fresh backup .."
	$DIR/adhoc.sh
fi


cd $ARCHIVE_FOLD
# loop for folder to compressed and remove
for folder in $(ls -1 | grep -E -v '\.'); do
  tar -cvjf "$folder.tar.bz2" "./$folder"
  echo "compressed $folder.tar.bz2"
  rm -rvf "./$folder"
done
OLD_FILES=`ls -t | sed -e '1,'${COPY}'d'| xargs -d "\n" rm -rvf `
