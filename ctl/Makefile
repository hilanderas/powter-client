.PHONY: install uninstall update
install: prepare config start
uninstall: stop restore remove
update: config restart

.PHONY: prepare config start restart status stop remove 
prepare:
	make -f prepare.mk prepare
remove:
	make -f remove.mk remove
config:
	make -f config.mk config
restore:
	make -f config.mk rmconf
start:
	make -f start.mk start
stop:
	make -f stop.mk stop
restart:
	make -f restart.mk restart
status:
	make -f status.mk status
showconf:
	make -f status.mk showconf 
.PHONY: reset_info
reset_info:
	make -f prepare.mk resetinfo

.PHONY: test_prepare test_remove test_info test_config
test_prepare:
	make -s -f test.mk test-files
	make -s -f test.mk is-info-valid

test_remove:
	make -s -f test.mk test-remove

test_info:
	make -s -f test.mk is-info-valid 

test_config:
	make -s -f test.mk test-config
	make -f status.mk showconf 

test_restore:
	make -s -f test.mk test-restore

.PHONY: restart_dns restart_bypass restart_sskcp
restart_dns:
	make -f restart.mk restart-dns
restart_bypass:
	make -f restart.mk restart-bypass
restart_sskcp:
	make -f restart.mk restart-sskcp

.PHONY: status_dns status_bypass status_sskcp
status_dns:
	make -f status.mk status-dns
status_bypass:
	make -f status.mk status-bypass
status_sskcp:
	make -f status.mk status-sskcp

