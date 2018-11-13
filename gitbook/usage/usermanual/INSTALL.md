# Install

### Download powter-client
```bash
wget  https://github.com/hilanderas/powter-client/releases/download/version/powter-client-m.n.p.zip
```

### Download images, congenerator, images API for 3 projects
```bash
make prepare
``` 
Test whether download resources successfully
```bash
make test_prepare
```

### Generate configuration
* Provide `info` file
```bash
make config -f path/to/info
```

* Edit info on line
```bash
make config -e
```

### Test configuration generated
```bash
make test_config
```

### Start services
```bash
make start 
```


