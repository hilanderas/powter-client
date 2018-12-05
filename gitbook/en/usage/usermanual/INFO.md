# info

`info` is used to customize user configuration of services. Users can modify it to meet their own requirements. 

There are 2 kinds of `info` in system
* info.yml - For service starting 
* info.queued.yml - For replacing info.yml

### Show info
* Show info 
```bash
make showinfo
```

* Show queued info
```bash
make show_queued_info
```

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
    number: 4  
  white:
    - filename: 03-vps
      content:
      - 1.1.1.1/32
      - 2.2.2.2/32
    - filename: 04-test
      content:
      - ip/net
      - ip/net
sskcp:
  - [ mode: sskcp/ss, logdir: /home/USER/snmplog, listenport: 2010, vpsip: 1.1.1.1 , vpsport: 4201 ,key: test] 
  - [ mode: sskcp/ss, logdir: /home/USER/snmplog, listenport: 2020, vpsip: 1.1.1.1, vpsport: 4202 ,key: test] 
  - [ mode: sskcp/ss, logdir: /home/USER/snmplog, listenport: 2030, vpsip: 2.2.2.2, vpsport: 4201, key: test] 
  - [ mode: sskcp/ss, logdir: /home/USER/snmplog, listenport: 2040, vpsip: 2.2.2.2, vpsport: 4202, key: test] 
```
`info` is yaml file, check detailed info about how to modify `info` of [dnsmasq](https://elespejo.github.io/dnsmasq/usage/GENCONF.html), [bypass](https://elespejo.github.io/bypass/usage/GENCONF.html), [sskcp](https://elespejo.github.io/sskcp/usage/GENCONF.html) 
