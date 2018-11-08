# Uninstall 

### Uninstall 

* Check all services' `NAME` 
```bash
make list
```

* Stop the services 
```
cd powter-client
make stop NAME=[NAME]
```

* Remove `compose` directory
```
make remove NAME=[NAME]
```