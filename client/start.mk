CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: start start-dns start-bypass start-sskcp

start: start-dns start-bypass start-sskcp

start-dns: $(POWTER_CLIENT_CONF)/dnsconf $(DNS_API)
	make -C $(DNS_API) config CONFIG=$(POWTER_CLIENT_CONF)/dnsconf NAME=$(PROJ)-dns && make -C $(DNS_API) start NAME=$(PROJ)-dns

start-bypass: $(POWTER_CLIENT_CONF)/bypassconf $(BYPASS_API)
	make -C $(BYPASS_API) config CONFIG=$(POWTER_CLIENT_CONF)/bypassconf NAME=$(PROJ)-bypass && make -C $(BYPASS_API) start NAME=$(PROJ)-bypass

confs = $(shell ls $(POWTER_CLIENT_CONF)/sskcpconf)
start-sskcp: $(POWTER_CLIENT_CONF)/sskcpconf $(SSKCP_API)
	$(foreach c, $(confs), make -C $(SSKCP_API) config CONFIG=$(POWTER_CLIENT_CONF)/sskcpconf/$(c) NAME=$(PROJ)-sskcp-$c && make -C $(SSKCP_API) start NAME=$(PROJ)-sskcp-$(c);)	




