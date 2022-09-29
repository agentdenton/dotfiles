#!/bin/sh

set -e

cd ~

BACKUP_DIR="backup"
OUT_ARCHIVE="backup.tar"

mkdir -p $BACKUP_DIR
cp -ur Documents Music Pictures Videos projects work games \
  notes.md todo.md $BACKUP_DIR
tar --acls --xattrs -cpvf $OUT_ARCHIVE $BACKUP_DIR
rm -rf $BACKUP_DIR
