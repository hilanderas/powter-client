# Update dnsconf

In following scenarios, you need to manipulate with dnsconf 

### Assign static IP to a host
* Go to conf-file directory specified in `info`

* Add a new file called static-hosts.conf like below
```
dhcp-host=aa:4c:79:22:31:ac,192.168.2.56,test-a
dhcp-host=ab:cc:97:23:33:ac,192.168.0.56,android-a
dhcp-host=ac:4d:88:24:3c:ac,192.168.0.88,laptop-a
```

### Define inner domain 
* Add a new file called inner-domain.conf in conf-file
```
address=/domain/192.168.0.1
```

### Specify the domain resolved by domestic dns server like 114.114.114.114
Add a new file in conf-file
```
server=/domain/114.114.114.114
```


### After add or modify files above, restart dns
```bash
cd power-client
make restart_dns
make status_dns
```

### Check whether configuration updated
```bash
make showconf_dns
```
