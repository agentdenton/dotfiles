#!/usr/bin/bash

# Backup source
BACKUP_SOURCE=/home/agent_denton/

# Backup destination
BACKUP_DEST=/opt

# Labels for backup name
HOST=${HOSTNAME}
DISTRO=archlinux
DATE=$(date "+%F")
BACKUP_FILE="$BACKUP_DEST/backup-$DISTRO-$HOST-$DATE.tar.gz"

echo "Procced with backup using tar?"
read confirm
if [[ $confirm == "y" || $confirm == "yes" ]]; then
    echo "Backup start..."
    tar --acls --xattrs -cpvf $BACKUP_FILE $BACKUP_SOURCE
else
    echo "Backup abort..."
fi
