#!/bin/bash

PROJ_NAME='puredoc'
PROJ_REPO="weichuntsai\\/${PROJ_NAME}"
PROJ_VER='1.1.0'

PTN_PROJ_NAME="s/\\\$PROJ_NAME\\\$/${PROJ_NAME}/g"
PTN_PROJ_REPO="s/\\\$PROJ_REPO\\\$/${PROJ_REPO}/g"
PTN_PROJ_VER="s/\\\$PROJ_VER\\\$/${PROJ_VER}/g"

DEP_NAME='texlive-small'

PTN_DEP_NAME="s/\\\$DEP_NAME\\\$/${DEP_NAME}/g"

SRC='tpl-readme.md'
OUTPUT='README.md'
if [[ -n "$1" ]]; then
  OUTPUT="$1"
fi

sed -r -e "$PTN_PROJ_NAME" -e "$PTN_PROJ_REPO" -e "$PTN_PROJ_VER" -e "$PTN_DEP_NAME" $SRC > $OUTPUT

