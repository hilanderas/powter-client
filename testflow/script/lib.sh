#!/bin/bash 
source .env
source hint.sh

netflow() {
	 #sudo iftop -NnP -i ${IFACE} -f "portrange $1" -t -s 10   
	  VPS=( "$@" )
    for i in "${VPS[@]}"
    do
        echo "$i"
				sudo iftop -i ${IFACE} -NnP -F "$i/24" -t -s 10
		done
}

confirm() {
    while true; do
        read -p "Do you wish to continue? [y/n]" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

re_boot() {
    hint "reboot"
		confirm 
    sudo reboot
}

config(){
	hint "Config"
	cd ${TEST_PROJ}
	if [ $1 ]
	then
		echo "make config TEST_INFO=${1} successfully"
		make config INFO=$1
		confirm
	else
		echo $TEST_INFO
		echo "make config successfully!"
		make config
		confirm
	fi
}

test_config(){
	hint "Test config"
	cd ${TEST_PROJ}
	if [ $1 ]
	then
		make test_config TEST_INFO=$1
		confirm
	else
		make test_config
		confirm
	fi
}

ctl(){
	cmd=${1}
	service=${2}
	hint "${cmd} ${service}"
	cd ${TEST_PROJ}
	if [ ${service} ]  
	then
		make ${cmd}_${service}
		confirm
	else 
		make ${cmd}
		confirm
	fi
}



ns_lookup(){
	hint "nslookup $1"
	nslookup $1 127.0.0.1
	#nslookup $1
}
