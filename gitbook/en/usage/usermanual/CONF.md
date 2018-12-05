# How to manipulate conf
There are 2 kinds of conf in system
* conf - For running service  
* conf.queued - For generating configuration


### Generate conf
Generate configuration in `powter-client-[ARCH]/client` according to info provided
```bash
make gen_config INFO=[INFO]
make show_queued_conf
```
If no `INFO` provided, a default one will be used instead


### Set conf
Move conf.queue to conf for use of service starting
```bash
make set_config
make showconf
``` 

### Pop conf
Move the queued conf to conf and restart all services
```bash
make pop_conf
make show_queued_conf
make showconf
```

### Restore conf
 Move conf to conf.queue 
```bash
make restore_config
make show_queued_conf
```

### Delete conf
Delete configuration in `powter-client-[ARCH]/client`
```bash
make rm_config
```
