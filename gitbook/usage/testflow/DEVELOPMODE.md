# Test flow in development mode

###  Git clone
```bash
git clone https://github.com/hilanderas/powter-client.git
```

### Set as development mode
* Set mode
```bash
cd powter-client/testflow/script
make set_mod TESTMODE=dev
```

* Read mode
```bash
make -s read_mod
```


### Initial configuration
```bash
make init_config TEST_PROJ=[TEST_PROJ]
```
`TEST_PROJ`: Path of `power-client/client`
e.g,
```bash
make init_config TEST_PROJ=/home/qa/powter-client/ctl
```

### Run test flow
* Preparation before test
```bash
make test_prepare
```

* run test scenarios
```bash
make [SCENARIO]
```
`SCENARIO:` Name of the test scenario, you can enter `make` and `tab` to see the whole lists.

	e.g,
* Install
```bash
make test_install
```

* Uninstall
```bash
make test_uninstall
```

* Switch vps test
```bash
make test_switch SLAVE=info_slave.yml
```

* Clean up
```bash
make cleanup
```