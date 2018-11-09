# Replace dns server

Sometimes vps used as dns server is in low performance or high latency, so you want to replace it to a new one. 

There are 2 ways to do this:
* Update `info` on line
* Update `info` with file provided by user


### Modify info on line
* Modify  `ip` in dnsserver and save
```bash
make config_dns -e 
```

* Restart dns service
```bash
make restart_dns 
```

* Check status
```bash
make status_dns
```

### Modify info file
* Modify  `ip` in dnsserver in `info` file and save
```bash
vi /path/to/info
```

* Restart dns service
```bash
make restart_dns 
```

* Check status
```bash
make status_dns
```