#!/bin/bash

# ROUTING_CTL=`pwd`/routing/routing-control
CLIENT_CTL=`pwd`/client/client-control
CONFIG_CTL=`pwd`/config/config-control

# Uninstall system

uninstall() {
    # Restore mechine from router
	# $ROUTING_CTL uninstall
	# Stop dns, bypass, ss-kcp service
	$CLIENT_CTL stop
    # delete config dir in project directories
    $CONFIG_CTL remove
#	reboot
}

# Install system

install() {
    # Copy config to its directory
    $CONFIG_CTL config
    # make mechine a router
	# $ROUTING_CTL install
	# Start dns, bypass, ss-kcp service
	$CLIENT_CTL start
#	reboot
}


# Display status 

status() {
	# $ROUTING_CTL status
	$CLIENT_CTL status
}

Usage() {
    echo $"Usage: $0 {install | uninstall | status }"
    exit 1
}

Parameter_num() {
    correct_num=$1
    real_num=$2
    if [ $correct_num != $real_num ];then
        Usage
    fi
}

# Entry point

case "$1" in
    install)
        Parameter_num 1 $#
        install
        ;;
    
    uninstall)
        Parameter_num 1 $#
        uninstall
        ;;
    
    status)
        Parameter_num 1 $#
        status
        ;;
  *)
    Usage
esac
