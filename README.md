# Powter-Client


Diversion Client on x86-based platform


# Deployment

### Download released package 
### Unzip
    ```
    unzip Powter-Client-[VERSION].zip
    cd Powter-Client-[VERSION] 
    ```

### Check the package md5
    ```
    md5sum -c Powter-Client-[VERSION].md5
    ```

### Set configuration
    According to your ss-kcp-server and dns-server, set the configuration.
    ```
    cd config/
    vim vps.json
    vim dnsserver.json
    ./config.sh
    ```

### Install the project
    ```
    cd Powter-Client-[VERSION]/
    ./system-init.sh install
    ```

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites
Develop Environment
* Ubuntu server 16.04 
* python 2.7.12 
* shell bin/bash

Software Needed
* System is updated by `sudo apt update; sudo apt full-upgrade`
* [Docker installed](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)
* Ipset installed by `sudo apt install ipset`


### Installing

* Install project
```
git clone https://github.com/meninasx86/Powter-Client.git
cd Powter-Client
sudo ./system-init.sh install 
```

* Uninstall project

```
cd Powter-Client
sudo ./system-init.sh uninstall 
```

* View the Diversion status

```
 cd Powter-Client
 ./system-init.sh status
```



### Running the tests

Go to the test directory
```
cd Powter-Client/Autotest/
```

Test status

```
# test whether project is installed completely
sudo ./test-control install

# test whether project is removed completely
sudo ./test-control uninstall
```

Test flow 
```
sudo ./test-flow
```


### Build
# TODO
./build_release.sh 


# Logistics

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **AP1001** - *Initial work* - [AP1001](https://github.com/ap1001)

See also the list of [contributors](https://github.com/meniasx86/Powter-Client/contributors) who participated in this project.




### License (open source only)

This project is licensed under the MIT License 

