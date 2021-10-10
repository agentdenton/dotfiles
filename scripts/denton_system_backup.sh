#!/usr/bin/bash

# Backup destination
BACKUP_DEST=/opt/backup

# Labels for backup name
HOST=${HOSTNAME}
DISTRO=archlinux
DATE=$(date "+%F")
BACKUP_FILE="$BACKUP_DEST/$DISTRO-$HOST-$DATE.tar.gz"

echo "Procced with backup using tar?"
read confirm
if [[ $confirm == "y" || $confirm == "yes" ]]; then
    echo "Backup start..."
    tar --acls --xattrs -cpvf $BACKUP_FILE /
else
    echo "Backup abort..."
fi
