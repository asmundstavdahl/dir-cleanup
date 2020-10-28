#!/bin/bash

mkdir -p t/1/11
mkdir -p t/1/12
mkdir -p t/2/21

touch    t/1/11/f

shards build

./bin/dir-cleanup t

FAILURE=0
Fail(){
    export FAILURE=1
    echo "FAILURE  $@" >&2
}

test -f t/1/11/f || Fail "test -f t/1/11/f"
test -d t/1/12   && Fail "test -d t/1/12"
test -d t/2      && Fail "test -d t/2"

rm -r t

if [ $FAILURE -eq 0 ]
then
    echo "[ OK ]"
else
    echo "[ FAILURE ]"
fi
