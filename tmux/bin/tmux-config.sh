#!/bin/sh

WIDTH=${1}

SMALL=80
MEDIUM=140

DATETIME="#[fg=colour243,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour15,bg=colour243] $(date +'%Y-%m-%d')  $(date +'%H:%M')"

if [ "$WIDTH" -ge "$SMALL" ]; then
    HOST="#[fg=colour68,bg=colour243,nobold,nounderscore,noitalics]#[italics,fg=colour15,bg=colour68] #h"
fi

# Spit out the final string, and collapse spaces
echo "$DATETIME $HOST " | sed 's/ *$/ /g'
