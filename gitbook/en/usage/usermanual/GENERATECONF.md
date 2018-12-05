# Generate conf
There are 2 kinds of conf in system
* conf - For service starting 
* conf.queued - For replacing conf


### Generate configuration in `powter-client-[ARCH]/client` according to info provided
```bash
make gen_config INFO=[INFO]
```
If no `INFO` provided, a default one will be used instead

### Delete configuration in `powter-client-[ARCH]/client`
```bash
make rm_config
```