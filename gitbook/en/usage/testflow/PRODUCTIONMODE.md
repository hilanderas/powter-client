# Test flow in production mode

###  Login router and download powter-client testflow packages
```bash
wget https://github.com/hilanderas/powter-client/releases/download/0.4.8/powter-client-testflow-0.4.8.zip
unzip powter-client-testflow-0.4.8.zip
```
[Check releases page for other versions](https://github.com/hilanderas/powter-client/releases)

### Download powter-client packages
```bash
cd powter-client-testflow
make -f main.mk download ARCH=[ARCH]
```
`ARCH`: x86 or armv6

### Config test environment
* Update `info.yml` and `info_slave.yml` in `powter-client-testflow` to meet your test environment

* Set project path, info file path and lan port 
```bash
make -f main.mk config TEST_PROJ=[PROJECT] TEST_INFO=[TEST_INFO] IFACE=[IFACE]
```
Description of each attribute:
* `TEST_PROJ`: Path of `power-client/client`
* `TEST_INFO`: Absolute path of `info.yml`
* `IFACE`: WAN of router

	e.g,
```bash
make -f main.mk config TEST_PROJ=$PWD/powter-client-x86 TEST_INFO=$PWD/info.yml IFACE=enp2s0
```

* Check configuration
```bash
make -f main.mk -s read_config
```

### Run test flow
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
	* Update dns or sskcp configuration
```bash
make -f update.mk test_update_dns
make -f update.mk test_update_sskcp
```
	* Switch vps test

	In this scenario, we assume that dns server and sskcp server are the same and we want to switch them to another groups and switch back again.	Prepare info_slave.yml, the main different between info.yml and info_slave.yml is the dns server IP and sskcp IP. 
```bash
make -f update.mk switch SLAVE=[SLAVE]
```
e.g,
```bash
make -f update.mk switch SLAVE=/home/qa/info_slave.yml
```

* Clean up
```bash
make -f main.mk cleanup 
rm -r ~/powter-client-x86*
```
