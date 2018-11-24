# Deployment

### Download relased package 0.4.4
* For x86
```bash
wget https://github.com/hilanderas/powter-client/releases/download/0.4.4/powter-client-x86-0.4.4.zip
```

* For armv6
```bash
wget https://github.com/hilanderas/powter-client/releases/download/0.4.4/powter-client-armv6-0.4.4.zip
```

### Install 
* Unzip packages
```bash
unzip powter-client-[ARCH]-0.4.4.zip
```

* Prepare installation environment

	In this step, dependency used by powter-client will be downloaded(including docker images)
```bash
cd powter-client-[ARCH]
make prepare
```

* Test status after preparation
```bash
make test_prepare
```
If preparation succeeds, you will see output like below:
```log
make -s -f test.mk test-files
elespejo/dnsmasq-armv6:0.8.2 exists
/home/ubuntu/powter-client-armv6/client/dnsmasq-confgenerator exists
/home/ubuntu/powter-client-armv6/client/dnsmasq-confgenerator-0.8.2.zip exists
/home/ubuntu/powter-client-armv6/client/dnsmasq-imageAPI-armv6 exists
/home/ubuntu/powter-client-armv6/client/dnsmasq-imageAPI-armv6-0.8.2.zip exists
elespejo/bypass-armv6:0.5.1 does exist
/home/ubuntu/powter-client-armv6/client/bypass-confgenerator exists
/home/ubuntu/powter-client-armv6/client/bypass-confgenerator-0.5.1.zip exists
/home/ubuntu/powter-client-armv6/client/bypass-imageAPI-armv6 exists
/home/ubuntu/powter-client-armv6/client/bypass-imageAPI-armv6-0.5.1.zip exists
elespejo/sskcp-armv6:0.4.7 does exist
/home/ubuntu/powter-client-armv6/client/sskcp-confgenerator exists
/home/ubuntu/powter-client-armv6/client/sskcp-confgenerator-0.4.7.zip exists
/home/ubuntu/powter-client-armv6/client/sskcp-client-imageAPI-armv6 exists
/home/ubuntu/powter-client-armv6/client/sskcp-client-imageAPI-armv6-0.4.7.zip exists
/home/ubuntu/powter-client-armv6/client/info.yml exists
make -s -f test.mk is-info-valid
/home/ubuntu/powter-client-armv6/client/info.yml is valid
```

* Disable `systemd-resolved` services (only for ubuntu 18.04)
```bash
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo systemctl status systemd-resolved
```
If disable succeeds,  you will see output like below:
```
sudo: unable to resolve host ubuntu: Resource temporarily unavailable
● systemd-resolved.service - Network Name Resolution
   Loaded: loaded (/lib/systemd/system/systemd-resolved.service; disabled; vendor preset: enabled)
   Active: inactive (dead)
     Docs: man:systemd-resolved.service(8)
           https://www.freedesktop.org/wiki/Software/systemd/resolved
           https://www.freedesktop.org/wiki/Software/systemd/writing-network-configuration-managers
           https://www.freedesktop.org/wiki/Software/systemd/writing-resolver-clients
```

* Config powter-client

 In this step, a `info` file will pop out asking you to edit and save with `:wq`
```bash
make config
make test_config
```

* Start powter-client
```bash
make start
```

* Check status of powter-client
```bash
make status
```

