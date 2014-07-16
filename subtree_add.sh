#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

### Usage
usage() {
cat << EOF
usage: $0 [options]

OPTIONS:
   -h      Show this message
   -n      Name of the remote/branch/subtree to create
   -r      URL of the remote to create a subtree of
   -o      Output path for the resulting subtree
   -b      Branch in which to install the subtree
EOF
}

### Parse parameters
NAME=""
URL=""
OUT_PATH=""
BRANCH="master"
while getopts ?hn:r:o:b:? opt
do
    case $opt in
        h)
            usage
            exit 1
            ;;
        n)
            NAME="$OPTARG"
            ;;
        r)
            URL="$OPTARG"
            ;;
        o)
            OUT_PATH="$OPTARG"
            ;;
        b)
            BRANCH="$OPTARG"
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

if [[ -z $NAME ]] || [[ -z $URL ]] || [[ -z $OUT_PATH ]] || [[ -z $BRANCH ]]; then
    usage
    exit 1
fi

git stash
git remote add subtree_$NAME $URL
git fetch subtree_$NAME
git checkout -b subtree_${NAME} subtree_$NAME/master
git checkout $BRANCH
git read-tree --prefix=$OUT_PATH -u subtree_${NAME}
git commit -m "[subtree] adding $NAME"
git stash pop
