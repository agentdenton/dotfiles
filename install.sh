#!/bin/sh

set -e

INSTALL_DIR=/usr/local/bin
DOTS_DIR=~/.dotfiles

if [[ $(pwd) != $DOTS_DIR ]]; then
    echo "Run this script from $DOTS_DIR"
    exit 1
fi
