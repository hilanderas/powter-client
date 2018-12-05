# Update dns settings

Sometimes vps used as dns server is in low performance or high latency, so you want to replace it to a new one or just add a new one.

The most simple way to update configuration is using `update`, which will change the default `INFO` in power-client-[ARCH]/client and restart all services 
```bash
make update
``` 

**Note that `info` can also be provided to update, like below:**
```bash
make update INFO=/path/to/info
```

* Check whether configuration updated
```bash
make showconf
```

* Check status of running services 
```bash
make test_state
```

