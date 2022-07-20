#!/bin/sh

set -e

cd ~

BACKUP_DIR="backup"
OUT_ARCHIVE="backup.tar"

mkdir -p $BACKUP_DIR
cp -ur cooking research memes documents pictures work projects \
  to_remember homework.gpg personal.gpg notes.md todo.md $BACKUP_DIR

tar --acls --xattrs -cpvf $OUT_ARCHIVE $BACKUP_DIR
rm -rf $BACKUP_DIR
