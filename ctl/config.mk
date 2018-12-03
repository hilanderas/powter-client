CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}


.PHONY: config edit genconf mkconf cleanconf rmconf
edit: $(QUEUED_INFO)
ifdef INFO
	vim $(INFO)
	cp $(INFO) $(QUEUED_INFO)
else
	vim $(QUEUED_INFO)
endif

mk-queued-conf: $(QUEUED_INFO)
	rm -rf $(QUEUED_CONF) || true
	mkdir $(QUEUED_CONF)

clean-queued-conf:
	rm -rf $(QUEUED_CONF)/*

gen-queued-conf: $(QUEUED_INFO) mk-queued-conf clean-queued-conf
	./confmgr.py validate --info $(QUEUED_INFO)
	./confmgr.py divideinfo --info $(QUEUED_INFO) --dns $(DNS_INFO) --bypass $(BYPASS_INFO) --sskcp $(SSKCP_INFO)
	cd $(DNS_CONFGEN) && python3 -m confgenerator.cli -f $(DNS_INFO) -d $(QUEUED_CONF)/dnsconf
	cd $(BYPASS_CONFGEN) && python3 -m confgenerator.cli -f $(BYPASS_INFO) -d $(QUEUED_CONF)/bypassconf
	cd $(SSKCP_CONFGEN) && python3 -m confgenerator.cli client -f $(SSKCP_INFO) -d $(QUEUED_CONF)/sskcpconf

rm-queued-conf: $(QUEUED_CONF)
	rm -rf $(QUEUED_CONF)


gen-conf: edit gen-queued-conf 

mk-conf: $(POWTER_CLIENT_INFO)
	rm -rf $(POWTER_CLIENT_CONF) || true
	mkdir $(POWTER_CLIENT_CONF)

set-conf: $(QUEUED_CONF) mk-conf 
	mv $(QUEUED_CONF)/* $(POWTER_CLIENT_CONF)/
	cp $(QUEUED_INFO) $(POWTER_CLIENT_INFO)

restore-conf: $(POWTER_CLIENT_CONF) $(QUEUED_CONF)
	mv $(POWTER_CLIENT_CONF)/* $(QUEUED_CONF)
