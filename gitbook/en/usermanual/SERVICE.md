# Service
There are 3 different services in system:
* [dnsmasq](https://elespejo.github.io/dnsmasq/) 
* [bypass](https://elespejo.github.io/bypass/)
* [sskcp](https://elespejo.github.io/sskcp/)

### Start all services
```
make start
```

### Stop all services

Keep `info`, `configuration` and `compose` 
```
make stop
```

### Restart
* Restart all services
```
make restart
```

* Restart dns
```
make restart_dns 
```

* Restart sskcp
```
make restart_sskcp 
```

* Restart bypass
```
make restart_bypass 
```



