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
test_reboot_p1: test_config test_start reboot
test_poweroff_p1: test_config test_start hint_off
else
test_reboot_p1 test_poweroff_p1: 
	echo "Please set test mode to either dev or prod!"
endif


.PHONY: test_reboot_p2 test_poweroff_p2 test_isprestart test_restartall
ifeq ($(TESTMODE),dev)
test_reboot_p2: status test_stop test_restore  
test_poweroff_p2: status test_stop test_restore
test_isprestart: test_config test_start hint_isp sleep_sec status test_stop test_restore
test_restartall: test_config test_start test_restart status test_stop test_restore
else ifeq ($(TESTMODE),prod)
test_reboot_p2: status nslookup netflow test_stop test_restore  
test_poweroff_p2: status nslookup netflow test_stop test_restore
test_isprestart: test_config test_start hint_isp sleep_sec status nslookup netflow test_stop test_restore
test_restartall: test_config test_start test_restart status nslookup netflow test_stop test_restore
else
test_reboot_p2 test_poweroff_p2 test_isprestart test_restartall:
	echo "Please set test mode to either dev or prod!"
endif


