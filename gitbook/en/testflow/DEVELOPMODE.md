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
make -s -f state.mk test_init
make -s -f state.mk test_prepared
make -s -f state.mk test_confgened
make -s -f state.mk test_running
make -s -f state.mk test_confqueued_pop_branch
make -s -f state.mk test_confqueued_rm_branch
make -s -f state.mk test_confready
```
	* Normal state test
```bash
make -s -f state.mk test_init_norm
make -s -f state.mk test_prepared_norm
make -s -f state.mk test_confgened_norm
make -s -f state.mk test_confready_norm
make -s -f state.mk test_running_norm
make -s -f state.mk test_confqueued_norm
```

* Run functional test flow
```bash
make -s -f function.mk test_install
make -s -f function.mk test_uninstall
make -s -f function.mk test_installafteruninstall
make -s -f function.mk test_reinstall
make -s -f function.mk test_reuninstall
make -s -f function.mk test_checkvps
```

* Run restart test flow
```bash
make -s -f restart.mk test_reboot_p1
make -s -f restart.mk test_reboot_p2
make -s -f restart.mk test_poweroff_p1
make -s -f restart.mk test_poweroff_p2
make -s -f restart.mk test_isprestart
make -s -f restart.mk test_restartall
```

* Run update test flow
```bash
make -s -f update.mk switch SLAVE=/path/to/info_slave.yml
make -s -f update.mk test_update_dns
make -s -f update.mk test_update_sskcp
```
