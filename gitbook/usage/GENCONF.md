# Generate configuration

### Download the configuration package
You can download the package from web page or command line.

* From web:  
    Go to the [release page](https://github.com/hilanderas/powter-client/releases) of this project and download `powter-config-[VERSION].zip`.

* From command line:  
    ```bash
    wget https://github.com/hilanderas/powter-client/releases/download/[VERSION]/powter-config-[VERSION].zip
    ```
    e.g, download configuration of version 0.3.0
    ```bash
    wget https://github.com/hilanderas/powter-client/releases/download/0.3.0/powter-config-0.3.0.zip
    ```

### Unzip and check md5
```bash
unzip powter-config-[VERSION].zip
cd powter-config/
md5sum -c powter-config-[VERSION].md5
```
e.g,
```bash
unzip powter-client-0.3.0.zip
cd powter-config/
md5sum -c powter-config-0.3.0.md5
```

### Download service configuration generator
```bash
make download 
```