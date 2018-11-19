# Test flow in production mode

###  Git clone 
```bash
git clone https://github.com/hilanderas/powter-client.git
```

### Set as production mode
* Set mode
```bash
cd powter-client/testflow/script
make set_mod TESTMODE=prod
```

* Read mode
```bash
make -s read_mod
```


### Config test environment

* Set project path, info file path and lan port 
```bash
make config PROJ=[PROJECT] INFO=[INFO] LAN=[LAN]
```
Description of each attribute:
* `PROJ`: Path of `power-client/client`
* `INFO`: Absolute path of `info.yml`
* `LAN`: Lan port of router

	e.g,
```bash
make config PROJ=/home/qa/powter-client/client INFO=/home/qa/info.yml LAN=enp0s25
```

* Check configuration
```bash
make -s check_config
```

### Run test flow
* Preparation before test
```bash
make test_prepare
```


```bash
make [SCENARIO]
```
`SCENARIO:` Name of a test scenario, you can enter `make` and `tab` to see the whole lists.

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

	Prepare info_slave.yml, the main different between info.yml and info_slave.yml is the dns server IP and sskcp IP. In this scenario, we assume that dns server and sskcp server are the same and we want to switch them to another groups and switch back again.
```bash
make test_switch SLAVE=[SLAVE]
```
`SLAVE`: slave info.yml 

	e.g,
```bash
make test_switch SLAVE=/home/qa/info_slave.yml
```

* Clean up
```bash
make cleanup
```