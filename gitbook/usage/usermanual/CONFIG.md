# Conf-info

Conf-info is used to customize user configuration of services. Users can modify it to meet their own requirements. 


### Conf-info template of dnsmasq
```yml
dhcp-range: 192.168.0.5,192.168.0.150,12h

dhcp-option: 6,192.168.0.1

cache-size: 3000

domain: powter

local: /powter

dns-server:
  - ip: 1.1.1.1
    ports:
      start-port: 16350
      end-port: 16370

  - ip: 2.2.2.2
    ports:
      start-port: 16350
      end-port: 16370
```
Conf-info is yaml file and you can test whether it is ok after modification with:
	
```
cd power-config
make testinfo_dns INFO=/path/to/info/dnsmasq.yml
```

Detailed info about how to modify configuration for dnsmasq:

[dnsmasq](https://elespejo.github.io/dnsmasq/usage/GENCONF.html)




### Conf-info template of sskcp
```yml
config:
  - log-dir: 

client:
  - ssport: 
    sskey:
    ip: 
    kcpport: 
    kcpkey:

  - ssport:
    sskey:  
    ip: 
    kcpport: 
    kcpkey:
```

Conf-info is yaml file and you can test whether it is ok after modification with:
```
cd power-config
make testinfo_sskcp INFO=/path/to/info/sskcp.yml
```


Detailed info about how to modify configuration for sskcp:

[sskcp](https://elespejo.github.io/sskcp/usage/GENCONF.html)
	


### Conf-info template of bypass
```yml
config:
  lan: br0
  base_port: 2010
  number: 16  

white:
  - filename: 03-vps
    content:
    - ip/net
    - ip/net

  - filename: 04-test
    content:
    - ip/net
    - ip/net
```

Conf-info is yaml file and you can test whether it is ok after modification with:
```
cd power-config
make testinfo_bypass INFO=/path/to/info/bypass.yml
```

Detailed info about how to modify configuration for bypass:

[bypass](https://elespejo.github.io/bypass/usage/GENCONF.html)

