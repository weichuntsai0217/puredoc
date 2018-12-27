#!/bin/bash

# puredoc command
puredoc() {

  # common regular expression pattern (PTN)
  local PTN_IS_TXT='\.txt$'
  local PTN_NL_TO_SPACE=':a;N;$!ba;s/\n/ /g'
  local PTN_MAIN_FILE_NAME='s/\.[^.]*$//g' # change 'aa.ext' into 'aa', 'aa.bb.ext' into 'aa.bb', 'aa.' into 'aa', 'aa..' into 'aa.'
  local PTN_SPACE_TO_COMMA="s/\ /', '/g"
  local PTN_LATEX='s/\\LaTeX/LaTeX/g'
  local PTN_MD_LINK='s/\[([^]]*)\]\(([^)]*)\)/\1 (\2)/g'
  local PTN_HASH_TAG='s/\\#/#/g'
  local PTN_BACKSLASH='s/\\\\/\\/g'
  local PTN_ASTERISK='s/\\\*/\*/g'
  local PTN_DOLLAR_SIGN='s/\\\$/\$/g'
  local PTN_CARET='s/\\\^/\^/g'
  local PTN_UNDERLINE='s/\\_/_/g'
  local PTN_BIGGER='s/&gt;/>/g'
  local PTN_LESS='s/&lt;/</g'
  local PTN_LEFT_BRACKET='s/\\\[/\[/g'
  local PTN_RIGHT_BRACKET='s/\\\]/\]/g'
  local PTN_APP_MARKBOTH_TO_CHP='s/^\\chapter\*\{(.*)\}(\\label\{.*\})/\\chapter\*\{\1\}\2\\markboth\{\1\}\{\}/g'
  local PTN_APP_MARKBOTH_TO_SEC='s/^\\section\*\{(.*)\}(\\label\{.*\})/\\section\*\{\1\}\2\\markboth\{\1\}\{\}/g'
  local PTN_APP_MARKBOTH_TO_SUBSEC='s/^\\subsection\*\{(.*)\}(\\label\{.*\})/\\subsection\*\{\1\}\2\\markboth\{\1\}\{\}/g'
  local PTN_APP_MARKBOTH_TO_SUBSUBSEC='s/^\\subsubsection\*\{(.*)\}(\\label\{.*\})/\\subsubsection\*\{\1\}\2\\markboth\{\1\}\{\}/g'

  # constants and messages
  local PIPE_DATA='/dev/stdin'
  local PIPE_INPUT_FILE=""
  local PDF_EXT='pdf'
  local MD_EXT='md'
  local TXT_EXT='txt'
  local ALL_EXT='all'
  local TEX_EXT='tex'
  local AUX_EXT='aux'
  local TPL_DIR="$HOME/puredoc-templates"
  local TPL_PREFIX='puredoc-tpl-'
  local TPL_RESUME='resume'
  local TPL_CL='coverletter'
  local TPL_ARTICLE='article'
  local TPL_BOOK='book'
  local VALID_TPL_RANGE="$TPL_RESUME $TPL_CL $TPL_ARTICLE $TPL_BOOK"
  local VALID_TPL_MSG=`echo "'$VALID_TPL_RANGE'" | sed -r "$PTN_SPACE_TO_COMMA"`
  local INFO_PREFIX='[INFO]'
  local ERR_PREFIX='[ERROR]'
  local OPT_PDF_ENGINE='--latex-engine=xelatex'

  # utils
  _puredoc_get_valid_output_ext_range() {
    local target_tpl="$1"
    local range_pdf_md_txt_all="$PDF_EXT $MD_EXT $TXT_EXT $TEX_EXT $ALL_EXT"
    local range_pdf_tex_all="$PDF_EXT $TEX_EXT $ALL_EXT"
    if [ "$target_tpl" == "$TPL_RESUME" ] || [ "$target_tpl" == "$TPL_CL" ]; then
      echo "$range_pdf_md_txt_all"
    elif [ "$target_tpl" == "$TPL_ARTICLE" ] || [ "$target_tpl" == "$TPL_BOOK" ]; then
      echo "$range_pdf_tex_all" 
    else
      echo "The argument of _puredoc_get_valid_output_ext_range is not valid."
      return 1
    fi
    return 0
  }

  _puredoc_get_valid_output_ext_msg() {
    local target_range="$1"
    local tail_msg=" ('$ALL_EXT' for all extensions)"
    if [[ "$target_range" == *"$ALL_EXT"* ]]; then
      echo "'$target_range'" | sed -r -e "$PTN_SPACE_TO_COMMA"  -e "s/$/$tail_msg/g"
    else
      echo "'$target_range'" | sed -r "$PTN_SPACE_TO_COMMA"
    fi
  }

  _puredoc_is_in_range() {
    # our range is a string containing strings which are separated by a space
    local target="$1"
    local range="$2"

    for item in $range; do
      if [ "$target" == "$item" ]; then
        echo 'true'
        return 0
      fi
    done
    echo 'false'
    return 1
  }

  _puredoc_remove_derived_files_for_pdf() {
    local need_to_remove_exts_range='aux bbl blg idx ilg ind lof log lot out toc tex'
    for ext in $need_to_remove_exts_range; do
      rm ${OUTPUT_NAME}.${ext} 2>/dev/null || true
    done
  }

  _puredoc_change_md_to_tex() {
    local arg_input="$1"
    local arg_output_file="$2"
    local arg_tpl_file="$3"
    if [ "$CJK" == "" ]; then
      pandoc $arg_input -o $arg_output_file -f markdown --template $arg_tpl_file $OPT_PDF_ENGINE --wrap=preserve 
    else
      pandoc $arg_input -o $arg_output_file -f markdown --template $arg_tpl_file $OPT_PDF_ENGINE --wrap=preserve --variable cjk="$CJK"
    fi
    sed -ri -e "$PTN_APP_MARKBOTH_TO_CHP" -e "$PTN_APP_MARKBOTH_TO_SEC" -e "$PTN_APP_MARKBOTH_TO_SUBSEC" -e "$PTN_APP_MARKBOTH_TO_SUBSUBSEC" $arg_output_file
  }

  _puredoc_change_md_to_md() {
    local arg_input="$1"
    local arg_output_file="$2"
    local arg_tpl_file="$3"
    pandoc $arg_input -o $arg_output_file -f markdown -t markdown --template $arg_tpl_file --wrap=preserve
  }

  _puredoc_show_msg_output_file() {
    echo -e "\n$INFO_PREFIX Your output file would be '$1'"
  }

  _puredoc_show_msg_tpl_user_use() {
    echo -e "\n$INFO_PREFIX The template you use is '$1'"
  }

  _puredoc_show_msg_xelatex_start() {
    echo -e "\n=== xelatex start ==="
  }

  _puredoc_process_single_file() {
    local arg_input="$1"
    local arg_output_ext="$2"
    local output_file="${OUTPUT_NAME}.${arg_output_ext}"
    
    if [ "$OUTPUT_DIR" != "" ]; then
      _puredoc_show_msg_output_file "${OUTPUT_DIR}/$output_file"
    else
      _puredoc_show_msg_output_file "$output_file"
    fi

    if [ "$arg_output_ext" == "$PDF_EXT" ]; then
      local derived_tex_file="${OUTPUT_NAME}.${TEX_EXT}"
      local derived_aux_file="${OUTPUT_NAME}.${AUX_EXT}"
      local tpl_file="${TPL_DIR}/${TPL_PREFIX}${TPL}.${TEX_EXT}"
      _puredoc_show_msg_tpl_user_use "$tpl_file"
      _puredoc_remove_derived_files_for_pdf
      _puredoc_change_md_to_tex "$arg_input" "$derived_tex_file" "$tpl_file"
      _puredoc_show_msg_xelatex_start
      xelatex $derived_tex_file # the derived_tex_file is tex format and is as the input of xelatex to generate output_file.
      bibtex $derived_aux_file # if users use `bib` file, we need to use bibtex make derived data.
      xelatex $derived_tex_file # need to do xelatex the 2nd time to make sure derived data (bibdata, hyper linke data, ...etc) updated OK.
      xelatex $derived_tex_file # need to do xelatex the 3rd time to make sure tables, links, bibliography rendered OK.
      _puredoc_remove_derived_files_for_pdf
    elif [ "$arg_output_ext" == "$TEX_EXT" ]; then
      local tpl_file="${TPL_DIR}/${TPL_PREFIX}${TPL}.${arg_output_ext}"
      _puredoc_show_msg_tpl_user_use "$tpl_file"
      _puredoc_change_md_to_tex "$arg_input" "$output_file" "$tpl_file"
    else
      local tpl_file="${TPL_DIR}/${TPL_PREFIX}${TPL}.${arg_output_ext}"
      _puredoc_show_msg_tpl_user_use "$tpl_file"
      _puredoc_change_md_to_md "$arg_input" "$output_file" "$tpl_file"
      if [ "$arg_output_ext" == "$MD_EXT" ]; then
        sed -ri -e "$PTN_LATEX" $output_file
      elif [ "$arg_output_ext" == "$TXT_EXT" ]; then
        sed -ri -e "$PTN_LATEX" -e "$PTN_MD_LINK" -e "$PTN_HASH_TAG" -e "$PTN_BACKSLASH" -e "$PTN_ASTERISK" -e "$PTN_DOLLAR_SIGN" -e "$PTN_CARET" -e "$PTN_UNDERLINE" -e "$PTN_BIGGER" -e "$PTN_LESS" -e "$PTN_LEFT_BRACKET" -e "$PTN_RIGHT_BRACKET" $output_file
      fi
    fi
    
    if [ "$OUTPUT_DIR" != "" ]; then
      mv $output_file ${OUTPUT_DIR}/
    fi
  }

  _puredoc_process_files() {
    local arg_valid_output_ext_range="$1"
    echo -e "\n$INFO_PREFIX Your input file is '$INPUT'."

    local arg_input="$INPUT"
		if [[ "$INPUT" =~ $PTN_IS_TXT ]]; then
      arg_input="`cat $INPUT | sed -r "$PTN_NL_TO_SPACE"`"
			echo "$INFO_PREFIX '$INPUT' is a file list containing files:"
      echo "  $arg_input"
		fi

    if [ "$OUTPUT_EXT" == "$ALL_EXT" ]; then
      for ext in $arg_valid_output_ext_range; do
        if [ "$ext" != "$ALL_EXT" ]; then
          _puredoc_process_single_file "$arg_input" "$ext"
        fi
      done
    else
      _puredoc_process_single_file "$arg_input" "$OUTPUT_EXT"
    fi
  }

  _puredoc_create_output_dir() {
    if [ "$OUTPUT_DIR" != "" ]; then
      test -d $OUTPUT_DIR || mkdir -p $OUTPUT_DIR
    fi
  }

  _puredoc_show_msg_arg_example() {
    echo "Please provide 3 arguments (including pipe data)."
    echo "For example, 'puredoc resume.yaml resume pdf' or 'cat resume.yaml | puredoc resume pdf -o myresume'."
  }

  _puredoc_show_msg_output_name() {
    local output_name="Your_Output_File_Name_Without_Extension"
    echo "$ERR_PREFIX Please provide '-o $output_name' or '--output $output_name' because your input file is from pipe data."
  }

  # preprocess arguments - START
  local POSITIONAL_ARGS=()
  local FLAG_OPTS="-d --dir -c --cjk -o --output --debug"
  local OUTPUT_DIR=""
  local CJK=""
  local CUSTOM_OUTPUT_MAIN_NAME=""
  local DEBUG_ARG=""
  while [[ $# -gt 0 ]]
  do
    key="$1"

    case $key in
      -d|--dir)
      if [[ "$FLAG_OPTS" == *"$2"*  ]]; then
        OUTPUT_DIR="${PWD}/output"
        shift 1 # past argument
      else
        OUTPUT_DIR="$2"
        shift 2 # past argument & value
      fi
      ;;
      -c|--cjk)
      if [[ "$FLAG_OPTS" == *"$2"*  ]]; then
        CJK="AR PL UMing TW"
        shift 1 # past argument
      else
        CJK="$2"
        shift 2 # past argument & value
      fi
      ;;
      -o|--output)
      if [[ "$FLAG_OPTS" == *"$2"*  ]]; then
        CUSTOM_OUTPUT_MAIN_NAME="output-of-puredoc-`date +%Y-%m-%d-%H-%M-%S`"
        shift 1 # past argument
      else
        CUSTOM_OUTPUT_MAIN_NAME="$2"
        shift 2 # past argument & value
      fi
      ;;
      --debug)
        DEBUG_ARG="true"
        shift 1 # past argument
      ;;
      *)    # unknown option
      POSITIONAL_ARGS+=("$1") # save it in an array for later
      shift 1 # past argument
      ;;
    esac
  done


  # Check if input file is from pipe data. - START
  if test -t 0; then
    echo "$INFO_PREFIX Use user defined input file in current directory."
  else
    echo "$INFO_PREFIX Use pipe data as input file."
    PIPE_INPUT_FILE="input-from-pipe-to-puredoc_`date +%Y-%m-%d-%H-%M-%S`_`date +%s%N`.md"
    cat $PIPE_DATA > $PIPE_INPUT_FILE
    POSITIONAL_ARGS=("$PIPE_INPUT_FILE" "${POSITIONAL_ARGS[@]}")
    if [ "$CUSTOM_OUTPUT_MAIN_NAME" == "" ]; then
      _puredoc_show_msg_output_name
      return 1
    fi
  fi
  # Check if input file is from pipe data. - END


  set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters
  local INPUT="$1" # input .yaml or .md file
  local TPL="$2" # template type depending on INPUT="$1"
  local OUTPUT_EXT="$3" # output file extension, depends on INPUT="$1" and TPL="$2"
  local TOT_POS_ARGS=3
  local OUTPUT_NAME=""
  if [ "$CUSTOM_OUTPUT_MAIN_NAME" == "" ]; then
    OUTPUT_NAME=`echo $INPUT | sed -r "$PTN_MAIN_FILE_NAME"`
  else
    OUTPUT_NAME="$CUSTOM_OUTPUT_MAIN_NAME"
  fi

  # For DEBUG - START
  if [ "$DEBUG_ARG" == "true" ];then
    local ARG_PREFIX='[DEBUG ARG]'
    echo "$ARG_PREFIX The number of positional arguments = $#"
    echo "$ARG_PREFIX The 1st positional argument (INPUT) = $INPUT"
    echo "$ARG_PREFIX The 2nd positional argument (TPL) = $TPL"
    echo "$ARG_PREFIX The 3rd positional argument (OUTPUT_EXT) = $OUTPUT_EXT"
    echo "$ARG_PREFIX The optional argument OUTPUT_DIR = $OUTPUT_DIR"
    echo "$ARG_PREFIX The optional argument CJK = $CJK"
    echo "$ARG_PREFIX The optional argument CUSTOM_OUTPUT_MAIN_NAME = $CUSTOM_OUTPUT_MAIN_NAME"
  fi
  # For DEBUG - END

  # preprocess arguments - END

  # check if arguments provided are enough.
  if [ $# -lt $TOT_POS_ARGS ]; then
    echo "$ERR_PREFIX The number of arguments is not enough."
    _puredoc_show_msg_arg_example
    return 1
  elif [ $# -gt $TOT_POS_ARGS ]; then
    echo "$ERR_PREFIX Too many arguments."
    _puredoc_show_msg_arg_example
    return 1
  fi

  # check if the 2nd argument is valid.
  if [ "`_puredoc_is_in_range "$TPL" "$VALID_TPL_RANGE"`" == 'false' ]; then
    echo "$ERR_PREFIX The 2nd argument (template) can only be ${VALID_TPL_MSG}. For example, 'puredoc $INPUT $TPL_RESUME $OUTPUT_EXT'"
    return 1
  fi

  # check if the 3rd argument is valid.
  local valid_output_ext_range=`_puredoc_get_valid_output_ext_range "$TPL"`
  if [ "`_puredoc_is_in_range "$OUTPUT_EXT" "$valid_output_ext_range"`" == 'false' ]; then
    local valid_output_ext_msg=`_puredoc_get_valid_output_ext_msg "$valid_output_ext_range"`
    echo "$ERR_PREFIX The 3rd argument (output file extension) can only be ${valid_output_ext_msg}. For example, 'puredoc $INPUT $TPL $PDF_EXT'."
    return 1
  fi

  # check if the input file (the 1st argument) exists.
  if [ ! -f "$INPUT" ]; then
    echo "$ERR_PREFIX The input file '$INPUT' does not exist."
    return 1
  fi

  _puredoc_create_output_dir
  _puredoc_process_files "$valid_output_ext_range"
  if [ "$PIPE_INPUT_FILE" != "" ]; then
    rm $PIPE_INPUT_FILE 2>/dev/null || true
  fi

}

puredoc "$@"
