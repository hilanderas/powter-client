# powter-client

* With powter-client, you can build a powerful router without knowing details of how the router works
* The arm and x86 are both supported

### Who should use

* If the number of clients in a local network is between  1-10, arm version is recommended

* If the number of clients in a private network is between  11-500, x86 version is recommended
 

### Pros and cons

##### Pros

* Integration of bypass, ss (short for shadowsocks), kcp with less configuration required
* Flexible strategy supported, ss+kcp or just ss
* Any number (usually 4-16) of ss+kcp is supported to satisfy different network flow requirement
* Anti DNS pollution
* Long term plan of development and maintenance(check roadmap)

##### Cons

* No UI
* No much documents about how to trouble shooting 
* Android, ios and windows is not supported

### Road map

* Real-time monitoring framework 
* Performance test framework
* Machine learning on snmp
* User-friendly interface
* All kinds of documents


# Network topology
![topology](https://www.lucidchart.com/publicSegments/view/ad585615-1dee-4b69-a5cf-a893afd0a46c/image.png)

# Deployment

See github page [here](https://hilanderas.github.io/powter-client/usage/DEPLOYMENT.html).

# Development setup

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

## Prerequisites
Develop Environment
* Ubuntu 18.04 
* shell bin/bash

Software Needed
* System is updated by `sudo apt update; sudo apt full-upgrade`
* [Docker CE installed](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* docker-compose
* make
* Ipset installed by `sudo apt install ipset`

## Build

* Build production package
```bash
make build version=[VERSION]
```
* Build testflow package
```bash
make build-testflow version=[VERSION]
```
* Build docs for github page
```bash
make build_book
```

# Logistics

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **AP1001** - *Initial work* - [AP1001](https://github.com/ap1001)
* **Valerio-Perez** - *Upgrade* - [Valerio-Perez](https://github.com/valerio-perez)

See also the list of [contributors](https://github.com/meniasx86/powter-client/contributors) who participated in this project.

### License 

This project is licensed under the MIT License 

