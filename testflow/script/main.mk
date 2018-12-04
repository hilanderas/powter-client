#!make
include .env
LIB=".env"
VERSION=0.4.6
PROJECT=powter-client

.PHONY: download rm_download
download:
	wget https://github.com/hilanderas/powter-client/releases/download/${VERSION}/${PROJECT}-${ARCH}-${VERSION}.zip
	unzip ${PROJECT}-${ARCH}-${VERSION}.zip

rm_download:
	rm -rf ${PROJECT}-${ARCH}*


.PHONY: config read_config init_config 
config: 
	sed -i '/TEST_PROJ/c\export TEST_PROJ=${TEST_PROJ}' ${LIB}
	sed -i '/TEST_INFO/c\export TEST_INFO=${TEST_INFO}' ${LIB}
	sed -i '/IFACE/c\export IFACE=${IFACE}' ${LIB}

read_config:
	cat ${LIB} | grep "TEST_PROJ"
	cat ${LIB} | grep "TEST_INFO"
	cat ${LIB} | grep "IFACE"

init_config: 
	sed -i '/TEST_PROJ/c\export TEST_PROJ=${TEST_PROJ}' ${LIB}
	sed -i '/TEST_INFO/c\export TEST_INFO=${CURDIR}/../info.yml' ${LIB}
	sed -i '/IFACE/c\export IFACE=enp0s25' ${LIB}

.PHONY: reset_env
reset_env:
	sed -i '/TEST_PROJ/c\export TEST_PROJ=' ${LIB}
	sed -i '/TEST_INFO/c\export TEST_INFO=' ${LIB}
	sed -i '/IFACE/c\export IFACE=' ${LIB}
	sed -i '/TESTMODE/c\export TESTMODE=' ${LIB}
	cat ${LIB}

.PHONY: set_mod read_mod 
set_mod:
	sed -i '/TESTMODE/c\export TESTMODE=${TESTMODE}' ${LIB}
read_mod:
	printenv TESTMODE

.PHONY: test_prepare test_prepare_again test_remove test_remove_again test_start test_start_again test_stop test_stop_again test_restore_conf test_restore_conf_again test_restart cleanup
test_prepare test_prepare_again:
	./prepare.sh

test_remove test_remove_again:
	./remove.sh

test_gen_conf test_gen_conf_1 test_gen_conf_2 test_gen_conf_3:
	./gen_conf.sh ${TEST_INFO}

test_rm_conf test_rm_conf_again:
	./rm_conf.sh

test_set_conf test_set_conf_again:
	./set_conf.sh

test_restore_conf test_restore_conf_again:
	./restore_conf.sh

test_start test_start_again test_start_1:
	./start.sh

test_stop test_stop_again:
	./stop.sh

test_restart:
	./restart.sh

cleanup: 
	./remove.sh

status:
	./status.sh

test_showconf test_showconf_again:
	./showconf.sh	

.PHONY: nslookup nslookup_again netflow_again
nslookup nslookup_again:
	./nslookup.sh

netflow netflow_again:
	./netflow.sh

test_pop_config:
	./pop_config.sh


.PHONY: test_install test_install_again test_uninstall test_uninstall_again test_update
install install_again:
	./install.sh

uninstall uninstall_again:
	./uninstall.sh


