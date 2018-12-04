#!make
include main.mk
.PHONY: update_slave update_origin update git_checkout

update_slave:
	./update.sh ${SLAVE} 

update_origin:
	./update.sh ${TEST_INFO}

update:
	./update.sh

git_checkout:
	git checkout ${TEST_INFO}


.PHONY: check-env
check_env:
ifndef SLAVE
	$(error SLAVE is underfined)
endif


.PHONY: switch_to_slave switch_back switch test_update_dns test_update_sskcp
ifeq ($(TESTMODE),dev)
switch: check_env install update_slave update_origin uninstall 
test_update_dns: install update uninstall git_checkout  
test_update_sskcp: install update uninstall git_checkout 
else ifeq ($(TESTMODE),prod)
switch: check_env install update_slave test_showconf nslookup netflow update_origin test_showconf nslookup_again netflow_again uninstall 
test_update_dns: install update test_showconf nslookup netflow uninstall   
test_update_sskcp: install update test_showconf nslookup netflow uninstall  
else
	echo "Please set test mode to either dev or prod"
endif
