#! /bin/bash
current=$1
expected=$2

if [[ "${current}" == "${expected}" ]]
then
    exit 0
else
    echo "The state is ${current}, cannot perform actions."
    exit 1
fi
