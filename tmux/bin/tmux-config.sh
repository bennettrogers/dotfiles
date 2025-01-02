#!/bin/sh

WIDTH=${1}

SMALL=80
MEDIUM=140

DATETIME="#[fg=colour236,bg=colour237,nobold,nounderscore,noitalics]#[fg=colour109,bg=colour236] $(date +'%Y-%m-%d')  $(date +'%H:%M')"

if [ "$WIDTH" -ge "$SMALL" ]; then
    HOST="#[fg=colour109,bg=colour237,nobold,nounderscore,noitalics]#[nobold,nounderscore,italics,fg=colour237,bg=colour109] #h "
fi

# Spit out the final string, and collapse spaces
echo "$DATETIME $HOST " | sed 's/ *$/ /g'
