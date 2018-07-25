#!/bin/bash

OLD_BRANCH="$1"
NEW_BRANCH="$2"

Usage(){
    echo "Usage: sudo $0 {OLD_BRANCH} {NEW_BRANCH}"
}

if [ "$#" -ne 2 ] ; then
    Usage
else 
    git checkout $OLD_BRANCH
    cd client/
    sudo ./client-control stop
    git checkout $NEW_BRANCH
    sudo ./client-control start
fi
