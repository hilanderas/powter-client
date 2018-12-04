# Test flow in development mode

###  Git clone
```bash
git clone https://github.com/hilanderas/powter-client.git
```

### Set as development mode
* Set mode
```bash
cd powter-client/testflow/script
make -f main.mk set_mod TESTMODE=dev
```

* Read mode
```bash
make -f main.mk read_mod
```


### Initial configuration
```bash
make -f main.mk init_config TEST_PROJ=[TEST_PROJ]
```
`TEST_PROJ`: Path of `power-client/client`
e.g,
```bash
make -f main.mk init_config TEST_PROJ=/home/qa/powter-client/ctl
```

### Run test flow
* Run state test flow
	* Abnormal state test
```bash
make -f state.mk test_init
make -f state.mk test_prepared
make -f state.mk test_conf_generated
make -f state.mk test_running
make -f state.mk test_queued_y
make -f state.mk test_queued_n
make -f state.mk test_conf_ready
```
	* Normal state test
```bash
make -f state.mk test_init_norm
make -f state.mk test_prepared_norm
make -f state.mk test_conf_gen_norm
make -f state.mk test_conf_ready_norm
make -f state.mk test_running_norm
make -f state.mk test_queued_norm
```

* Run functional test flow
```bash
make -f function.mk test_install
make -f function.mk test_uninstall
make -f function.mk test_installafteruninstall
make -f function.mk test_reinstall
make -f function.mk test_reuninstall
make -f function.mk test_checkvps
```

* Run restart test flow
```bash
make -f restart.mk test_reboot_p1
make -f restart.mk test_reboot_p2
make -f restart.mk test_poweroff_p1
make -f restart.mk test_poweroff_p2
make -f restart.mk test_isprestart
make -f restart.mk test_restartall
```

* Run update test flow
```bash
make -f update.mk switch SLAVE=/path/to/info_slave.yml
make -f update.mk test_update_dns
make -f update.mk test_update_sskcp
```
