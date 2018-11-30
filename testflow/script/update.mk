#!make

.PHONY: restart_dns restart_sskcp restart_bypass status_sskcp status_bypass status_dns test_config_slave test_config_e git_checout
restart_dns:
	./restart.sh dns

restart_bypass:
	./restart.sh bypass

restart_sskcp:
	./restart.sh sskcp

status_dns:
	./status dns

status_bypass:
	./status bypass

status_sskcp:
	./status sskcp

test_config_slave:
	./config_f.sh ${SLAVE} 

test_config_e:
	./config_e.sh

git_checkout:
	git checkout ${TEST_INFO}


.PHONY: check-env
check_env:
ifndef SLAVE
	$(error SLAVE is underfined)
endif

.PHONY: switch_to_slave switch_back switch test_update_dns test_update_sskcp
ifeq ($(TESTMODE),dev)
switch_to_slave: test_config test_start test_config_slave restart_dns restart_sskcp status_dns status_sskcp test_showconf
switch_back: test_config restart_dns restart_sskcp status_dns status_sskcp test_showconf
switch: check_env switch_to_slave switch_back test_stop test_restore
test_update_dns: test_config test_start test_config_e restart_dns status_dns test_stop test_restore git_checkout  
test_update_sskcp: test_config test_start test_config_e restart_sskcp restart_bypass status_sskcp status_bypass test_stop test_restore git_checkout
else ifeq ($(TESTMODE),prod)
switch_to_slave: test_config test_start nslookup netflow test_config_slave restart_dns restart_sskcp status_dns status_sskcp test_showconf nslookup netflow
switch_back: test_config restart_dns restart_sskcp status_dns status_sskcp test_showconf nslookup netflow
switch: check_env switch_to_slave switch_back test_stop test_restore
test_update_dns: test_config test_start nslookup netflow test_config_e restart_dns status_dns nslookup netflow test_stop test_restore   
test_update_sskcp: test_config test_start nslookup netflow test_config_e restart_sskcp restart_bypass status_sskcp status_bypass nslookup netflow test_stop test_restore 
else
	echo "Please set test mode to either dev or prod"
endif
