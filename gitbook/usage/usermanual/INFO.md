# info

`info` is used to customize user configuration of services. Users can modify it to meet their own requirements. 


### `info` template 
```yml
dnsmasq: 
  dhcp-range: 192.168.0.5,192.168.0.150,12h
  dhcp-option: 6,192.168.0.1
  cache-size: 3000
  domain: powter
  local: /powter/
  dns-server:
    - ip: 1.1.1.1
      ports:
        start-port: 16350
        end-port: 16370
    - ip: 2.2.2.2
      ports:
        start-port: 16350
        end-port: 16370
bypass:
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
sskcp:
  - mode: sskcp/ss
    logdir: /home/USER/snmplog 
    listenport: 2001
    vpsip: 
    vpsport: 
    key:
    dest: /home/USER/conf 
```
`info` is yaml file and you can test whether it is ok after modification with:
	
```
cd powter-client
make test_info INFO=path/to/info
```

Detailed info about how to modify `info` of [dnsmasq](https://elespejo.github.io/dnsmasq/usage/GENCONF.html), [bypass](https://elespejo.github.io/bypass/usage/GENCONF.html), [sskcp](https://elespejo.github.io/sskcp/usage/GENCONF.html) 
