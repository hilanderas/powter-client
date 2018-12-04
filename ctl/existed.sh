#! /bin/bash
if [ -e "$1" ]
then
	echo "$1 exists."
else
	echo "$1 does NOT exist."
fi
