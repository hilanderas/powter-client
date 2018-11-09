# Replace sskcp server

Sometimes vps used as sskcp server is in low performance or high latency, so you want to replace it to a new one. 


### Modify info
```bash
make config_sskcp -e 
```
Modify  `ip` in sskcpserver and save

### Restart sskcp service
```bash
make restart_sskcp 
```