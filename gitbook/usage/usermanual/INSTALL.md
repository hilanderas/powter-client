# Install
There are 2 ways to install powter-client:
* One key installation
```bash
make install
```
* Install step by step like below:
##### Download powter-client
```bash
wget  https://github.com/hilanderas/powter-client/releases/download/version/powter-client-m.n.p.zip
```
##### Download images, congenerator, images API for 3 projects
```bash
make prepare
``` 
##### Test whether download resources successfully
```bash
make test_prepare
```
##### Generate configuration
Provide `info` file, you will be asked to edit it on line, just enter `:wq` to save the file if you don't need to modify it.
```bash
make config INFO=path/to/info
```
Please note that if `info` is not provided, a default one will pop up and you can edit it on line before save.
```bash
make config 
```
##### If you want script keep running without stopping, add `INTRERACTION=false` at the end of the command (not applicable for 0.4.4)
```bash
make config INFO=path/to/info INTRERACTION=false
```
##### Test configuration generated
```bash
make test_config
```
##### Start services
```bash
make start 
```


