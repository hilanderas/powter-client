#!make
include main.mk

.PHONY: reboot hint_off hint_isp sleep_sec
reboot:  
	./reboot.sh

hint_off:
	$(info ===============Please power off the Router!===================)

hint_isp:
	$(info ================Please restart isp!====================)

sleep_sec:
	sleep 120


.PHONY: test_reboot_p1 test_poweroff_p1
ifeq ($(TESTMODE), $(filter $(TESTMODE),dev prod))
test_reboot_p1: install reboot
test_poweroff_p1: install hint_off
else
test_reboot_p1 test_poweroff_p1: 
	echo "Please set test mode to either dev or prod!"
endif


.PHONY: test_reboot_p2 test_poweroff_p2 test_isprestart test_restartall
ifeq ($(TESTMODE),dev)
test_reboot_p2: status uninstall
test_poweroff_p2: status uninstall 
test_isprestart: install hint_isp sleep_sec status uninstall 
test_restartall: install test_restart status uninstall 
else ifeq ($(TESTMODE),prod)
test_reboot_p2: status nslookup netflow uninstall 
test_poweroff_p2: status nslookup netflow uninstall 
test_isprestart: install hint_isp sleep_sec status nslookup netflow uninstall 
test_restartall: install test_restart status nslookup netflow uninstall 
else
test_reboot_p2 test_poweroff_p2 test_isprestart test_restartall:
	echo "Please set test mode to either dev or prod!"
endif


