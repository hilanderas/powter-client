#!/bin/bash
source .env

VPS=($(grep -o 'vpsip: [0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' ${TEST_INFO} | sort -u))

i=0
VPS_SERVER=()

while [ $i -lt ${#VPS[@]} ]
do
	if [ ${VPS[$i]} != "vpsip:" ]
	then
		VPS_SERVER=(${VPS_SERVER[@]} ${VPS[$i]})
	fi
	(( i++ ))
done

echo "${VPS_SERVER[@]}"

