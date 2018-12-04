include main.mk

.PHONY: install uninstall test_checkvps installafteruninstall test_reinstall uninstall 
ifeq ($(TESTMODE),dev)
test_install test_uninstall: install uninstall

test_installafteruninstall: install uninstall install_again uninstall_again

test_reinstall: install  install_again uninstall

test_reuninstall: install uninstall uninstall_again
 
else ifeq ($(TESTMODE),prod)
test_install: install nslookup netflow uninstall 

test_uninstall: install uninstall  nslookup netflow 

test_installafteruninstall: install uninstall install_again nslookup netflow uninstall

test_reinstall: install install_again nslookup netflow uninstall 

test_reuninstall: install uninstall uninstall_again nslookup netflow

else
test_install test_uninstall test_checkvps test_installafteruninstall test_reinstall: 
	echo "Please set test mode to either dev or prod"
endif

.PHONY: test_checkvps
test_checkvps: install test_showconf uninstall 

