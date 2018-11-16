CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: stop stop-dns stop-bypass stop-sskcp

stop: stop-dns stop-bypass stop-sskcp

stop-dns: $(POWTER_CLIENT_CONF)/dnsconf $(DNS_API)
	make -C $(DNS_API) stop NAME=$(PROJ)-dns
	make -C $(DNS_API) remove NAME=$(PROJ)-dns

stop-bypass: $(POWTER_CLIENT_CONF)/bypassconf $(BYPASS_API)
	make -C $(BYPASS_API) stop NAME=$(PROJ)-bypass
	make -C $(BYPASS_API) remove NAME=$(PROJ)-bypass

composes = $(shell ls $(SSKCP_API)/compose)
stop-sskcp: $(SSKCP_API)/compose $(SSKCP_API)
	$(foreach c, $(composes), make -C $(SSKCP_API) stop NAME=$(basename $(c)) && make -C $(SSKCP_API) remove NAME=$(basename $(c));)	


	



