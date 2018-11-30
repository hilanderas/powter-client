include main.mk

.PHONY: test_install test_uninstall test_checkvps test_installafteruninstall test_reinstall test_uninstall 
ifeq ($(TESTMODE),dev)
test_install: test_config test_start test_stop test_restore
test_uninstall: test_config test_start test_stop test_restore
test_installafteruninstall: test_config test_start test_stop test_restore test_config_again test_start_again test_stop_again test_restore_again
test_reinstall: test_config test_start test_config_again test_start_again test_stop test_restore
test_reuninstall: test_config test_start test_stop test_restore test_stop_again test_restore_again
else ifeq ($(TESTMODE),prod)
test_install: test_config test_start nslookup netflow test_stop test_restore
test_uninstall: test_config test_start test_stop nslookup netflow test_restore
test_installafteruninstall: test_config test_start test_stop test_restore test_config_again test_start_again nslookup netflow test_stop_again test_restore_again
test_reinstall: test_config test_start test_config_again test_start_again nslookup netflow test_stop test_restore
test_reuninstall: test_config test_start test_stop test_restore test_stop_again test_restore_again nslookup netflow
else
test_install test_uninstall test_checkvps test_installafteruninstall test_reinstall test_uninstall: 
	echo "Please set test mode to either dev or prod"
endif

.PHONY: test_checkvps
test_checkvps:
	./config_f.sh ${TEST_INFO}
	./start.sh
	./showconf.sh
	./stop.sh
	./restore.sh		


