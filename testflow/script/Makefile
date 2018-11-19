#!make
include .env
LIB=".env"
VERSION=0.4.3
PROJECT=powter-client

.PHONY: download rm_download
download:
	wget https://github.com/hilanderas/powter-client/releases/download/${VERSION}/${PROJECT}-${ARCH}-${VERSION}.zip
	unzip ${PROJECT}-${ARCH}-${VERSION}.zip

rm_download:
	rm -rf ${PROJECT}-${ARCH}*


.PHONY: config read_config init_config 
config: 
	sed -i '/PROJ/c\export PROJ=${PROJ}' ${LIB}
	sed -i '/INFO/c\export INFO=${INFO}' ${LIB}
	sed -i '/LAN/c\export LAN=${LAN}' ${LIB}

read_config:
	cat ${LIB} | grep "PROJ"
	cat ${LIB} | grep "INFO"
	cat ${LIB} | grep "LAN"

init_config: 
	sed -i '/PROJ/c\export PROJ=${PROJ}' ${LIB}
	sed -i '/INFO/c\export INFO=${CURDIR}/../info.yml' ${LIB}
	sed -i '/LAN/c\export LAN=br0' ${LIB}

.PHONY: reset_env
reset_env:
	sed -i '/PROJ/c\export PROJ=' ${LIB}
	sed -i '/INFO/c\export INFO=' ${LIB}
	sed -i '/LAN/c\export LAN=' ${LIB}
	sed -i '/TESTMODE/c\export TESTMODE=' ${LIB}
	cat ${LIB}

.PHONY: set_mod read_mod 
set_mod:
	sed -i '/TESTMODE/c\export TESTMODE=${TESTMODE}' ${LIB}
read_mod:
	printenv TESTMODE


.PHONY: test_prepare test_remove cleanup test_install test_uninstall test_checkvps test_installafteruninstall test_reinstall test_uninstall test_reboot_p1 test_reboot_p2 test_poweroff_p1 test_poweroff_p2 test_isprestart test_restartall test_switch test_updateconfig_sskcp test_updateconfig_bypass 
test_prepare:
	./prepare.sh

test_remove:
	./remove.sh

cleanup: test_remove reset_env

test_install:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./status.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./status.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_uninstall:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh	
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./nslookup.sh
	./netflow.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_checkvps:
	./config_f.sh ${INFO}
	./start.sh
	./showconf.sh
	./stop.sh
	./restore.sh		

test_installafteruninstall:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./restore.sh
	./config_f.sh ${INFO}
	./start.sh
	./status.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./restore.sh
	./config_f.sh ${INFO}
	./start.sh
	./status.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh

else 
	echo "Please set the env either dev or prod!"
endif


test_reinstall:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./config_f.sh ${INFO}
	./start.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_reuninstall:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./restore.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./stop.sh
	./restore.sh
	./stop.sh
	./restore.sh
	./nslookup.sh
	./netflow.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_reboot_p1:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./reboot.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./reboot.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_reboot_p2:
ifeq ($(TESTMODE),dev)
	./status.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./status.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_poweroff_p1:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	echo "============================="
	echo "Please power off the powter client"
	echo "============================="
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	echo "============================="
	echo "Please power off the powter client"
	echo "============================="
else 
	echo "Please set the env either dev or prod!"
endif

test_poweroff_p2:
ifeq ($(TESTMODE),dev)
	./status.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./status.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_isprestart:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	echo "=============================="
	echo "Please restart isp before continue........"
	echo "=============================="
	sleep 10
	./status.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	echo "=============================="
	echo "Please restart isp before continue........"
	echo "=============================="
	sleep 10
	./status.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif

test_restartall:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./restart.sh
	./stop.sh
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./restart.sh
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif


test_switch:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	./config_f.sh ${SLAVE}
	./restart.sh dns
	./restart.sh sskcp
	./status.sh dns
	./status.sh sskcp
	./config_f.sh ${INFO}
	./restart.sh dns
	./restart.sh sskcp
	./status.sh dns
	./status.sh sskcp
	./stop.sh 
	./restore.sh
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	./config_f.sh ${SLAVE}
	./restart.sh dns
	./restart.sh sskcp
	./status.sh dns
	./status.sh sskcp
	./nslookup.sh
	./netflow.sh
	./config_f.sh ${INFO}
	./restart.sh dns
	./restart.sh sskcp
	./status.sh dns
	./status.sh sskcp
	./nslookup.sh
	./netflow.sh
	./stop.sh 
	./restore.sh
else 
	echo "Please set the env either dev or prod!"
endif


test_updateconfig_dns:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh dns
	./status.sh dns
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh dns
	./status.sh dns
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else 
	echo "Please set the env either dev or prod!"
endif


test_updateconfig_sskcp:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh sskcp
	./status.sh sskcp
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh sskcp
	./status.sh sskcp
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else 
	echo "Please set the env either dev or prod!"
endif


test_updateconfig_bypass:
ifeq ($(TESTMODE),dev)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh bypass
	./status.sh bypass
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else ifeq ($(TESTMODE), prod)
	./config_f.sh ${INFO}
	./start.sh
	#same as config_f cause $INFO is still exist
	./config_e.sh 
	./restart.sh bypass
	./status.sh bypass
	./nslookup.sh
	./netflow.sh
	./stop.sh
	./restore.sh
	git checkout ${INFO}
else 
	echo "Please set the env either dev or prod!"
endif


