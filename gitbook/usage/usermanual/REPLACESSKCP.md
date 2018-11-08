# Replace sskcp server

Sometimes vps used as sskcp server is in low performance or high latency, so you want to replace it to a new one. 


### In powter-client, stop current service

* [Check serving sskcp server and configuration NAME](CHECKVPS.md)

* Stop current sskcp service
```
cd powter-client
make stop_sskcp NAME=[NAME]
make remove_sskcp NAME=[NAME]
```

### In powter-config, generate new configuration

* Update sskcp [conf-info](CONFIG.md)

* Create configuration for sskcp
```bash
make config_sskcp INFO=/path/to/conf-info/sskcp.yml DEST=/path/to/config_sskcp
```

### In powter-client, start service again

* Regenerate docker compose with **same** `NAME` and new configuration
```bash
make config_sskcp CONFIG=/path/to/config_sskcp NAME=[NAME]
```

* Start sskcp service again
```bash
make start_sskcp NAME=[NAME]
```