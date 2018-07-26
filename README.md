# Powter-Client
Install Powter-Client on x86 or arm 


# What is Powter used for 

### For small enterprise

With Powter, you can build a powterful router for your enterprise without knowing details of how router works

* Specify forward rule for packages from one interface to another on Powter-Client
* Specify flow category from Powter-Client to Powter-Server
* Choose between tcp/udp from Powter-Client to Powter-Server
* Define DNS server used 

### For soho

Use as simple as a arm-based architecture like raspberry pi to build a working environments, which can be connected from anywhere 

### For self-study

TCP/IP is too hard to understand, don't worry, change the way you learn. Other than reading a lot of book but still don't get it, why not try and build a router and see it 


## Why Powter-Client

* No special hardware needs, just a hardware with 2 or more network interfaces

* We have a team to do this full time, we give our commit to contribute to open source continually 


## Vision
We aim to contribute to the open source community and provide our professional services to people who are willing to build a powerful and user friendly router.

Powter-Client can be run on x86 (mostly for company) and arm (mostly for individual) architecture; Powter-Server can be run on remote x86 pc (mostly vps) with ubuntu server OS.

Anything can be configured conveniently with GUI.

Choose the approach method to Internet

Choose among different strategies


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



# Logistics

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **AP1001** - *Initial work* - [AP1001](https://github.com/ap1001)

See also the list of [contributors](https://github.com/meniasx86/Powter-Client/contributors) who participated in this project.

### License (open source only)

This project is licensed under the MIT License 

