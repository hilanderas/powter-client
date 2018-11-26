#!/bin/sh
ZIP=$1
WHERE=$2
URL=$3
DIR=$4
if [ ! -f "${ZIP}" ]; then
    cd ${WHERE} && wget ${URL} && unzip ${ZIP};
else
    cd ${WHERE} && rm -rf ${DIR} && unzip ${ZIP};
fi	
