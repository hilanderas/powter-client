# Install 

There are 2 steps to install project
1. Config - prepare configuration for each service
2. Start - start all services



### Config 

* Download configuration generator package and unzip, e.g, download 0.3.1 
```bash
wget https://github.com/hilanderas/powter-client/releases/download/0.3.1/powter-config-0.3.1.zip
unzip powter-config-0.3.1.zip
```

* Modify powter-info.env, which indicates version of confgenerator packages for each module 
```yml
ARCH=
DNS_VERSION=
SSKCP_VERSION=
BYPASS_VERSION=
```

	**Meaning of each attribute**

	`ARCH` : Hardware architecture, e.g, armv6 or x86 

	`DNS_VERSION`: [Version of dnsmasq-confgenerator packages](https://github.com/elespejo/dnsmasq/releases)

	`SSKCP_VERSION`: [Version of sskcp-confgenerator packages](https://github.com/elespejo/sskcp/releases)

	`BYPASS_VERSION`: [Version of bypass-confgenerator packages](https://github.com/elespejo/bypass/releases)



* Download confgenerator of all modules specified in 	`powter-info.env`
```bash
make download
```

* Generate configuration template needed by each module. After this step, you will see a `conf-info` directory generated in current directory
```bash
make geninfo
```

	**Structure of conf-info**
```
conf-info/
|_dnsmasq.yml
|_sskcp.yml
|_bypass.yml
```

* [Modify conf-info according to user requirements](CONFIG.md)

* Create configuration for each modules. After this step, you will see the `/path/to/config/powter-config` generated.
```bash
make config INFO=/path/to/conf-info DEST=/path/to/config/powter-config
```
	**Structure of `powter-config`**
```
powter-config
|_powter-info.env
|_powter-configuration
   |_dns_conf/
   |  |_...
   |_sskcp_conf/
   |  |_...
   |_bypass_conf/
      |_...
```


### Start

* Download powter-client-version.zip for installation and unzip, e.g, download 0.3.1 
```bash
wget https://github.com/hilanderas/powter-client/releases/download/0.3.1/powter-client-0.3.1.zip
unzip powter-client-0.3.1.zip
```
* Download images API and docker images for all modules
```bash
cd powter-client
make download CONFIG=/path/to/config/powter-info.env
```
* Generate docker compose file for images to start
```bash
make config CONFIG=/path/to/config/powter-config NAME=[NAME]
```
* Start to install, given a `NAME` as you like, which will be used to identity your services
```bash
make start NAME=[NAME]
```

* Check status
```bash
make status NAME=[NAME]
```

### Install after uninstall

Sometimes downloading packages may be failed due to network problem during installation process, what you can do is to follow the instruction below to do installation again.

* Install failed
* [Uninstall](UNINSTALL.md)
* Install again
```bash
make config CONFIG=/path/to/config/powter-config NAME=[NAME]
make start NAME=[NAME]
```


 

 
