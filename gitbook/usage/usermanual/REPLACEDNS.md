# Replace dns server

Sometimes vps used as dns server is in low performance or high latency, so you want to replace it to a new one. 


### In powter-client, stop current service

* [Check serving dns server and configuration NAME](CHECKVPS.md)

* Stop current dns service
```
cd powter-client
make stop_dns NAME=[NAME]
make remove_dns NAME=[NAME]
```

### In powter-config, generate new configuration

* Update dnsmasq [conf-info](CONFIG.md), modify `ip` or `port` nested under `dns-server`

* Create configuration for dns
```bash
make config_dns INFO=/path/to/conf-info/dnsmasq.yml DEST=/path/to/config_dns
```

### In powter-client, start service again

* Regenerate docker compose with **same** `NAME` and new configuration
```bash
make config_dns CONFIG=/path/to/config_dns NAME=[NAME]
```

* Start dns service again
```bash
make start_dns NAME=[NAME]
```