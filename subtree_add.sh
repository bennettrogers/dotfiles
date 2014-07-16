#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

### Usage
usage() {
cat << EOF
usage: $0 [options]

OPTIONS:
   -h      Show this message
   -r      URL of the remote to create a subtree of
   -o      Output path for the resulting subtree
EOF
}

### Parse parameters
URL=""
OUT_PATH=""
while getopts ?h:r:o:? opt
do
    case $opt in
        h)
            usage
            exit 1
            ;;
        r)
            URL="$OPTARG"
            ;;
        o)
            OUT_PATH="$OPTARG"
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

if [[ -z $URL ]] || [[ -z $OUT_PATH ]]; then
    usage
    exit 1
fi

NAME=${URL##*/}

git remote add subtree_$NAME $URL
git fetch subtree_$NAME
git checkout -b subtree_${NAME} subtree_$NAME/master
git checkout master
git read-tree --prefix=$OUT_PATH -u subtree_${NAME}
git commit -m "[subtree] adding $NAME"
