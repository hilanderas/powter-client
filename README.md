# Powter-Client

* With Powter-Client, you can build a powerful router without knowing details of how the router works
* The arm and x86 are both supported

### Who should use

* If the number of clients in a local network is between  1-10, arm version is recommended

* If the number of clients in a private network is between  11-500, x86 version is recommended
 

### Pros and cons

##### Pros

* Integration of bypass, shadowsocks, pen, kcp with less configuration required
* Anti DNS pollution
* Long term plan of development and maintenance(check roadmap) 

##### Cons

* Only ss:kcp = 1:4 is supported currently
* Strategy can't be changed, such as from ss+kcp to ss+BBR

### Road map

* Build and install on arm infrastructure
* The ss:kcp can be configured from 1:1 to 1:n in docker images
* Strategy can be configured
* Real-time monitoring framework 
* Performance test framework
* Machine learning on snmp
* User-friendly interface


# Network topology (todo)
(Need picture here or redirect to wiki)


# Deployment
This is a simple step of deployment. More details see wiki page [here]().(todo)

### 1. Download released package 
Go to the release page( [here](https://github.com/hilanderas/Powter-Client/releases) ). Select the version you want to use, and click to download.

### 2. Unzip and check the md5
```
unzip Powter-Client-[VERSION].zip
cd Powter-Client-[VERSION] 
md5sum -c Powter-Client-[VERSION].md5
```

### 3. Set configuration
According to your ss-kcp-server and dns-server, set the configuration. More detail of setting configuration see the wiki page [here]().
```
cd config/
vim vps.json
vim dnsserver.json
./config.sh
```

### 4. Install the project
```
cd Powter-Client-[VERSION]/
./system-init.sh install
```

### 5. Test status
```
cd AutoTest
sudo ./test-control install
```


# Development setup

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

## Prerequisites
Develop Environment
* Ubuntu server 16.04 
* python 2.7
* shell bin/bash

Software Needed
* System is updated by `sudo apt update; sudo apt full-upgrade`
* [Docker installed](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)
* Ipset installed by `sudo apt install ipset`

## Build (todo)


# Release history (todo)
More details on wiki [here]()

# Roadmap
https://time.graphics/line/108579

# Logistics

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **AP1001** - *Initial work* - [AP1001](https://github.com/ap1001)

See also the list of [contributors](https://github.com/meniasx86/Powter-Client/contributors) who participated in this project.

### License 

This project is licensed under the MIT License 

