#!/bin/bash
REMOVE_BY_PORT() {
    port=$1
    for i in /powter_data/kcplog/$port/snmp*.log
    do
        echo $i
        rm $i
    done
}


REMOVE() {
    for port in 1060 1070 1080 1090
    do
        REMOVE_BY_PORT $port
    done
}


REMOVE

