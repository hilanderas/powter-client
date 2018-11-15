# Uninstall 

### Uninstall the services 
Delete all services, default `info`, `compose` `configuration`  
```
cd powter-client
make uninstall 
```

### Delete downloads

* Delete all resource downloaded in prepare session, including docker images, confgenerator and image API packages
```bash
make remove 
```

* Test whether removal is successful
```bash
make test_remove
```