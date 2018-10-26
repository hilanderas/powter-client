# Deployment

### Download the deployment package
    
You can download the deployment package from web page or command line.

* From web:  
Go to the [release page](https://github.com/hilanderas/powter-client/releases) of this project. Select the package according to the architecture of your machine.

* From command line:  
```bash
wget https://github.com/hilanderas/powter-client/releases/download/[VERSION]/powter-client-[VERSION].zip
```
  * VERSION : the release tag  

  e.g : Deploy a powter-client with the release 0.3.0 by executing
  ```bash
  wget https://github.com/hilanderas/powter-client/releases/download/0.3.0/powter-client-0.3.0.zip
  ```

### Unzip

```bash
unzip powter-client-[VERSION].zip
cd powter-client/
```

### Download needed project

Three projects are needed in powter-client. They are dns, sskcp, bypass.
```bash
make download CONFIG_PKG=[CONF_PATH]
```
* [CONF_PATH] : the absolute path of configuration package  

This action downloads the image API and image of dns, sskcp, bypass to current directory. The version of those are specified in `[CONF_PATH]/config.env`.

Also, The download of single project is supported.
e.g: 
* download dns project image API
```bash
make download_dns_api CONFIG_PKG=[CONF_PATH]
```
* download dns project image
```bash
make download_dns_image CONFIG_PKG=[CONF_PATH]
```
* download all image 
```bash
make download_image CONFIG_PKG=[CONF_PATH]
```
* download all api
```bash
make download_api CONFIG_PKG=[CONF_PATH]
```

See more target of make file by using `make(space)(tab)(tab)`

### Generate the docker compose file

Docker compose file is used for powter-client deployment. 

```bash
make config CONFIG_PKG=[CONF_PATH]
```

This action generates compose files in `[image_API]/compose`.

Also, The generation of single project is supported.
e.g:
* generate dns compose file
```bash
make config_dns CONFIG_PKG=[CONF_PATH]
```

### Start the service
```bash 
make start CONFIG_PKG=[CONF_PATH]
```
This action starts all services( `dns`, `sskcp`, `bypass` ).  
Also, the start of single service is supported.
e.g: start service `dns`
```bash
make start_dns CONFIG_PKG=[CONF_PATH]
```
After starting the dns service successfully, you may see the output similar with the following: 
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml up -d
Pulling router_dnsmasq (elespejo/dnsmasq-x86:0.5.6)...
0.5.6: Pulling from elespejo/dnsmasq-x86
4fe2ade4980c: Already exists
5a492975f351: Pull complete
070fe1f3f59a: Pull complete
Digest: sha256:f4682be5a4eb5b740d865eef6bb79f537410739f233e495292f09ffeba1b6344
Status: Downloaded newer image for elespejo/dnsmasq-x86:0.5.6
Creating dns_router_dnsmasq_1 ... done
```

### Restart the service
```bash
make restart CONFIG_PKG=[CONF_PATH]
```
This action restarts all services( `dns`, `sskcp`, `bypass` ).  
Also, restarting single service is supported.

e.g: restart dns service
```bash
make restart_dns CONFIG_PKG=[CONF_PATH]
```
After restarting the dns service successfully, you may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml up -d --force-recreate
Recreating dns_router_dnsmasq_1 ... done
```

### Check status of the service
```bash
make status NAME=[COMP_NAME]
```
This action shows the status of all services( `dns`, `sskcp`, `bypass` ).  
Also, checking status of single service is supported.
e.g: check the status of dns service
```bash
make status_dns CONFIG_PKG=[CONF_PATH]
```
You may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml ps
        Name                Command          State      Ports
-------------------------------------------------------------
dns_router_dnsmasq_1   /bin/sh -c ./init      UP
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml logs
Attaching to dns_router_dnsmasq_1
router_dnsmasq_1  | ...
...
```

### Stop the service
```bash
make stop CONFIG_PKG=[CONF_PATH]
```
This action stops all services( `dns`, `sskcp`, `bypass` ).  
Also, the stop of single service is supported.
e.g: stop dns service
```bash
make stop CONFIG_PKG=[CONF_PATH]
```
After stoping the service successfully, you may see the output similar with the following:
```
docker-compose -p dns -f ~/dnsmasq-imageAPI-x86/compose/dns.yml down
Stopping dns_router_dnsmasq_1 ... done
Removing dns_router_dnsmasq_1 ... done
```

### Remove the compose file
```bash
make remove CONFIG_PKG=[CONF_PATH]
```
This action removes all the compose files of all services( `dns`, `sskcp`, `bypass` ).  
Also, removing the compose file of single service is supported.
e.g: remove compose file of dns 
```bash
make remove_dns CONFIG_PKG=[CONF_PATH]
```
You may see the output similar with the following:
```
rm ~/dnsmasq-imageAPI-x86/compose
```
Check whether the remove step successfully:
```bash
ls compose | grep dns
```
