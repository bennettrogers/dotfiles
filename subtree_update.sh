#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

### Usage
usage() {
cat << EOF
usage: $0 [options]

OPTIONS:
   -h      Show this message
   -r      URL of the remote associated with the subtree to update
EOF
}

### Parse parameters
URL=""
while getopts ?h:r:? opt
do
    case $opt in
        h)
            usage
            exit 1
            ;;
        r)
            URL="$OPTARG"
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

if [[ -z $URL ]]; then
    usage
    exit 1
fi

NAME=${URL##*/}

git remote add subtree_$NAME $URL
git fetch subtree_$NAME
git checkout -b subtree_${NAME} subtree_$NAME/master
git checkout master
git merge --squash -s subtree --no-commit subtree_$NAME
git commit -m "[subtree] updating $NAME"
