#!/bin/bash
#----------------------------------------
# OPTIONS
#----------------------------------------
DAYS_TO_KEEP=7 # 0 to keep forever
WWW_PATH='/var/www'
BACKUP_PATH='/home/xubuntu/Public/backups/www'
#----------------------------------------

# Create the backup folder
if [ ! -d $BACKUP_PATH ]; then
  mkdir -p $BACKUP_PATH
fi

# change into the web root directory
cd "$WWW_PATH"
if [ "$(pwd)" != "$WWW_PATH" ] ; then
  echo "Failed to change directory to root of web path"
  exit
fi

for website in * ; do
  if [[ -d $website && ! -L "$website" ]]; then
    echo "Found website folder: $website"
    date=$(date -I)
    tar -cvpzf $BACKUP_PATH/$date-$website.tar.gz $website
  fi
done

# Delete old backups
if [ "$DAYS_TO_KEEP" -gt 0 ] ; then
  echo "Deleting backups older than $DAYS_TO_KEEP days"
  find $BACKUP_PATH/* -mtime +$DAYS_TO_KEEP -exec rm {} \;
fi

