# include main.mk

.PHONY: reboot hint_off hint_isp sleep_sec
reboot:  
	./reboot.sh

hint_off:
	./hint.sh "Please power off the powter client"

hint_isp:
	./hint.sh "Please restart isp before continue..."

sleep_sec:
	sleep 120


.PHONY: test_reboot_p1 test_poweroff_p1
test_reboot_p1: test_config test_start reboot
test_poweroff_p1: test_config test_start hint_off


.PHONY: test_reboot_p2 test_power_off_p2 test_isprestart test_restartall
ifeq ($(TESTMODE),dev)
test_reboot_p2: status test_stop test_restore  
test_power_off_p2: status test_stop test_restore
test_isprestart: test_config test_start hint_isp sleep_sec status test_stop test_restore
test_restartall: test_config test_start test_restart status test_stop test_testore
else ifeq ($(TESTMODE),prod
test_reboot_p2: status nslookup netflow test_stop test_restore  
test_power_off_p2: status nslookup netflow test_stop test_restore
test_isprestart: test_config test_start hint_isp sleep_sec status nslookup netflow test_stop test_restore
test_restartall: test_config test_start test_restart status nslookup netflow test_stop test_testore
else
	echo "Please set test mode to either dev or prod!"
endif


