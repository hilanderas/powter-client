CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: config edit genconf
edit: $(POWTER_CLIENT_INFO)
	# if INFO exists, vim INFO, after save, copy INFO to POWTER_CLIENT_INFO
	# else vim POWTER_CLIENT_INFO
ifdef INFO
	vim $(INFO)
	cp $(INFO) $(POWTER_CLIENT_INFO)
else
	vim $(POWTER_CLIENT_INFO)
endif

genconf: $(POWTER_CLIENT_INFO) $(POWTER_CLIENT_CONF) cleanconf
	./confmgr.py divideinfo --info $(POWTER_CLIENT_INFO) --dns $(DNS_INFO) --bypass $(BYPASS_INFO) --sskcp $(SSKCP_INFO)
	cd $(DNS_CONFGEN) && python3 -m confgenerator.cli $(DNS_INFO) -d $(POWTER_CLIENT_CONF)/dnsconf
	cd $(BYPASS_CONFGEN) && python3 -m confgenerator.cli $(BYPASS_INFO) -d $(POWTER_CLIENT_CONF)/bypassconf
	cd $(SSKCP_CONFGEN) && python3 -m confgenerator.cli client -f $(SSKCP_INFO) -d $(POWTER_CLIENT_CONF)/sskcpconf


config: $(POWTER_CLIENT_INFO) edit genconf 

cleanconf:
	rm -rf $(POWTER_CLIENT_CONF)/*
