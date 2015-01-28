#!/bin/bash
# function Extract for common file formats
# function has been modified from 

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    # eg: ./extract.sh tempdir/* /home/dineshkp/temp/trial/
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz> <extract_path>"
 else
    if [ -f "$1" ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf "$1" -C "$2"   ;;
          *.tar.gz)    tar xvzf "$1" -C "$2"   ;;
          *.tar.xz)    tar xvJf "$1" -C "$2"   ;;
          #*.lzma)      unlzma "$1"      ;;
          #*.bz2)       bunzip2 -kc "$1" | "$2"    ;;
          #*.rar)       unrar x -ad "$1" ;;
          #*.gz)        gunzip "$1"      ;;
          *.tar)       tar xvf "$1"  -C "$2"   ;;
          *.tbz2)      tar xvjf "$1" -C "$2"   ;;
          *.tgz)       tar xvzf "$1" -C "$2"   ;;
          *.zip)       unzip "$1"  -d "$2"     ;;
          #*.Z)         uncompress "$1"  ;;
          #*.7z)        7z x "$1"        ;;
          #*.xz)        unxz "$1"        ;;
          #*.exe)       cabextract "$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
        exit -1
    fi
fi
}
extract $1 $2