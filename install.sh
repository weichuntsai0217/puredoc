# $TEXMFHOME is the directory where you put your LaTeX pagckages (in tds folder structure).
# "puredoc-templates" of this project would be copied into the folder "puredoc-templates/" under your home directory.

init() {
  local ERR_PREFIX='[ERROR]'
  local SUCCESS_PREFIX='[SUCCESS]'
  local INFO_PREFIX='[INFO]'
  local PUREDOC_TPL_FOLDER='puredoc-templates'
  local DIR_USER_PANDOC_TEMPLATES="${HOME}/${PUREDOC_TPL_FOLDER}"
  local USER_BASHRC="${HOME}/.bashrc"
  local PUREDOC_TDS_FOLDER='puredoc-tds'
  local PUREDOC_SCRIPT_NAME='puredoc'
  local PUREDOC_SCRIPT_FILE="${PUREDOC_SCRIPT_NAME}.sh"
  local DIR_BIN='/usr/local/bin'

  if [ "$TEXMFHOME" == "" ]; then
    echo -e "\n$ERR_PREFIX '\$TEXMFHOME' is not set."
    echo -e "Please add a line like 'export TEXMFHOME=\"Some Directory You Want\"' at the end of '$USER_BASHRC' and 'source' it."
    echo -e "For example, you can run:\n  echo 'export TEXMFHOME=\"\$HOME/texmf\"' >> $USER_BASHRC; source $USER_BASHRC"
    return 1
  elif [ ! -d "$TEXMFHOME" ]; then
    echo "$ERR_PREFIX The \$TEXMFHOME directory '$TEXMFHOME' does not exist. Please use command 'mkdir' to create it."
    echo -e "For example, you can run:\n  mkdir -p \$TEXMFHOME"
    return 1
  else
    echo "$INFO_PREFIX \$TEXMFHOME ($TEXMFHOME) exists."
  fi

  if [ ! -d "$DIR_USER_PANDOC_TEMPLATES" ]; then
    echo "$INFO_PREFIX Creating '$DIR_USER_PANDOC_TEMPLATES'..."
    mkdir -p $DIR_USER_PANDOC_TEMPLATES
    if [ "$?" == "0" ]; then
      echo "$SUCCESS_PREFIX '$DIR_USER_PANDOC_TEMPLATES' is created."
    else
      echo "$ERR_PREFIX '$DIR_USER_PANDOC_TEMPLATES' is not created."
      return 1
    fi
  else
    echo "$INFO_PREFIX '$DIR_USER_PANDOC_TEMPLATES' exists. No need to re-create it."
  fi

  cp -r ${PUREDOC_TDS_FOLDER}/* $TEXMFHOME
  if [ "$?" == "0" ]; then
    echo "$SUCCESS_PREFIX The content of '${PUREDOC_TDS_FOLDER}/' is copied into \$TEXMFHOME ($TEXMFHOME)."
  else
    echo "$ERR_PREFIX The content '${PUREDOC_TDS_FOLDER}/' is NOT copied into \$TEXMFHOME ($TEXMFHOME)."
    return 1
  fi

  cp -r ${PUREDOC_TPL_FOLDER}/* $DIR_USER_PANDOC_TEMPLATES
  if [ "$?" == "0" ]; then
    echo "$SUCCESS_PREFIX The content of '${PUREDOC_TPL_FOLDER}/' is copied into '$DIR_USER_PANDOC_TEMPLATES'"
  else
    echo "$ERR_PREFIX The content of '${PUREDOC_TPL_FOLDER}/' is NOT copied into '$DIR_USER_PANDOC_TEMPLATES'"
    return 1
  fi

  cp $PUREDOC_SCRIPT_FILE $DIR_BIN
  if [ "$?" == "0" ]; then
    echo "$SUCCESS_PREFIX The '$PUREDOC_SCRIPT_FILE' is copied into '$DIR_BIN'"
  else
    echo "$ERR_PREFIX The '$PUREDOC_SCRIPT_FILE' is NOT copied into '$DIR_BIN'"
    return 1
  fi

  chmod 755 ${DIR_BIN}/${PUREDOC_SCRIPT_FILE}
  if [ ! -f ${DIR_BIN}/${PUREDOC_SCRIPT_NAME} ]; then
    ln -s ${DIR_BIN}/${PUREDOC_SCRIPT_FILE} ${DIR_BIN}/${PUREDOC_SCRIPT_NAME}
    if [ "$?" == "0" ]; then
      echo "$SUCCESS_PREFIX The link '$PUREDOC_SCRIPT_NAME' -> '$PUREDOC_SCRIPT_FILE' is established OK."
    else
      echo "$ERR_PREFIX The link '$PUREDOC_SCRIPT_NAME' -> '$PUREDOC_SCRIPT_FILE' is NOT established."
      return 1
    fi
  fi

  if [ "$?" == "0" ]; then
    echo "$SUCCESS_PREFIX Installation/Update is completed."
  else
    echo "$ERR_PREFIX Installation/Update is NOT completed."
    return 1
  fi

  return 0
}

init
