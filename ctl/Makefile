.PHONY: install uninstall update
install: prepare config start
uninstall: stop restore remove
update: config restart

.PHONY: prepare gen_config set_config start restart stop restore_config rm_config remove 
prepare:
	make -s -f sm.mk is_INIT_PREPARED && make -f prepare.mk prepare && make -f sm.mk set_PREPARED
remove:
	make -f sm.mk is_PREPARED && make -f remove.mk remove && make -f remove.mk remove-images && make -f sm.mk set_INIT
gen_config:
	make -f sm.mk is_PREPARED_CONFGENED && make -f config.mk gen-conf && make -f sm.mk set_CONFGENED
rm_config:
	make -f sm.mk is_CONFGENED && make -f config.mk rm-queued-conf && make -f sm.mk set_PREPARED
set_config:
	make -f sm.mk is_CONFGENED && make -f config.mk set-conf && make -f sm.mk set_CONFREADY
restore_config:
	make -f sm.mk is_CONFREADY && make -f config.mk restore-conf && make -f sm.mk set_CONFGENED
start:
	make -s -f sm.mk is_CONFREADY && make -f start.mk start && make -f sm.mk set_RUNNING
stop:
	make -f sm.mk is_RUNNING && make -f stop.mk stop && make -f sm.mk set_CONFREADY
restart:
	make -f sm.mk is_RUNNING && make -f restart.mk restart
update_config:
	make -f sm.mk is_RUNNING && make -f config.mk gen-conf && make -f sm.mk set_CONFQUEUED
.PHONY: get_state status showconf show_queued_info show_queued_conf
get_state:
	make -f sm.mk get_state
status:
	make -f status.mk status
showinfo:
	make -f status.mk showinfo
show_queued_info:
	make -f status.mk show-queued-info
showconf:
	make -f status.mk showconf 
show_queued_conf:
	make -f status.mk show-queued-conf 

.PHONY: reset_info
reset_info:
	make -f prepare.mk resetinfo

.PHONY: test_prepare test_remove test_info test_config
test_prepare:
	make -s -f sm.mk get_state
	make -s -f test.mk test-files
	make -s -f test.mk is-info-valid

test_remove:
	make -s -f sm.mk get_state
	make -s -f test.mk test-remove

test_info:
	make -s -f test.mk is-info-valid 

test_config:
	make -s -f sm.mk get_state
	make -s -f test.mk test-config
	make -f status.mk showconf 

test_restore:
	make -s -f sm.mk get_state
	make -s -f test.mk test-restore

test_start:
	make -s -f sm.mk get_state
	docker ps -a	

test_stop:
	make -s -f sm.mk get_state
	docker ps -a	

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

