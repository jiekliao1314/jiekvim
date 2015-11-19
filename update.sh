#!/bin/bash

if [ $# -gt 0 ];then
    dest=$1
    src=.$1
    rm -rf $dest
    cp -r ~/$src .
    mv $src $dest 
    rm -rf `find ./vim -name ".git*"`
else
    echo 'Arg is wrong !'
fi
