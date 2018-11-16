CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: restart restart-dns restart-bypass restart-sskcp

restart: restart-dns restart-bypass restart-sskcp

restart-dns: $(POWTER_CLIENT_CONF)/dnsconf $(DNS_API) 
	make -f stop.mk stop-dns
	make -f start.mk start-dns

restart-bypass: $(POWTER_CLIENT_CONF)/bypassconf $(BYPASS_API)
	make -f stop.mk stop-bypass
	make -f start.mk start-bypass

restart-sskcp: $(POWTER_CLIENT_CONF)/sskcpconf $(SSKCP_API)
	make -f stop.mk stop-sskcp
	make -f start.mk start-sskcp

