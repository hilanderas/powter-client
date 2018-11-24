# Replace dns server

Sometimes vps used as dns server is in low performance or high latency, so you want to replace it to a new one or just add a new one.


The most simple way to update configuration is using `update`, which will change the default `INFO` in power-client-[ARCH]/client and restart all services 
```bash
make update
``` 

Alternatively, there are other 2 ways to update dns configuration without restarting other services:
* Update `info` on line
* Update `info` with file provided by user


### Modify info on line
* Modify  `ip` in dns-server and save
```bash
make config
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
* Modify  `ip` in dns-server in `info` file and save
```bash
vi /path/to/info
```
* Generate configuration
```bash
make config INFO=/path/to/info INTERATION=no
```

* Restart dns service
```bash
make restart_dns 
```

* Check status
```bash
make status_dns
```

