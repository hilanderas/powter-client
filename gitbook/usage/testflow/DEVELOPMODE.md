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
make -f state.mk test_configured
make -f state.mk test_running
```
	* Normal state test
```bash
make -f state.mk test_prepare_twice
make -f state.mk test_config_twice
```

* Prepare test environment before test
Download packages from modules, download images and generate info file
```bash
make -f main.mk test_prepare
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
make -f update.mk test_switch=/path/to/info_slave.yml

	* Clean up
Remove all packages and images after if all tests have been done.
```bash
make -f main.mk test_remove
```
