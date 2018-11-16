CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

.PHONY: is-dns-image-existed is-bypass-image-existed is-sskcp-image-existed
is-dns-image-existed: 
	((test ! -z $(shell docker images -q $(DNS_IMAGE))) && echo "$(DNS_IMAGE) exists") || (echo "$(DNS_IMAGE) does NOT exist") 

is-bypass-image-existed: 
	((test ! -z $(shell docker images -q $(BYPASS_IMAGE))) && echo "$(BYPASS_IMAGE) does exist") || echo "$(BYPASS_IMAGE) does NOT exist"

is-sskcp-image-existed: 
	((test ! -z $(shell docker images -q $(SSKCP_IMAGE))) && echo "$(SSKCP_IMAGE) does exist") || echo "$(SSKCP_IMAGE) does NOT exist"

.PHONY: is-dns-confgen-existed is-bypass-confgen-existed is-sskcp-confgen-existed
is-dns-confgen-existed:
	((test -d $(DNS_CONFGEN)) && echo "$(DNS_CONFGEN) exists") || (echo "$(DNS_CONFGEN) does NOT exist") 
	((test -e $(DNS_CONFGEN_ZIP)) && echo "$(DNS_CONFGEN_ZIP) exists") || (echo "$(DNS_CONFGEN_ZIP) does NOT exist") 

is-bypass-confgen-existed:
	((test -d $(BYPASS_CONFGEN)) && echo "$(BYPASS_CONFGEN) exists") || (echo "$(BYPASS_CONFGEN) does NOT exist") 
	((test -e $(BYPASS_CONFGEN_ZIP)) && echo "$(BYPASS_CONFGEN_ZIP) exists") || (echo "$(BYPASS_CONFGEN_ZIP) does NOT exist") 

is-sskcp-confgen-existed:
	((test -d $(SSKCP_CONFGEN)) && echo "$(SSKCP_CONFGEN) exists") || (echo "$(SSKCP_CONFGEN) does NOT exist") 
	((test -e $(SSKCP_CONFGEN_ZIP)) && echo "$(SSKCP_CONFGEN_ZIP) exists") || (echo "$(SSKCP_CONFGEN_ZIP) does NOT exist") 

.PHONY: is-dns-api-existed is-bypass-api-existed is-sskcp-api-existed
is-dns-api-existed:
	((test -d $(DNS_API)) && echo "$(DNS_API) exists") || (echo "$(DNS_API) does NOT exist") 
	((test -e $(DNS_API_ZIP)) && echo "$(DNS_API_ZIP) exists") || (echo "$(DNS_API_ZIP) does NOT exist") 

is-bypass-api-existed:
	((test -d $(BYPASS_API)) && echo "$(BYPASS_API) exists") || (echo "$(BYPASS_API) does NOT exist") 
	((test -e $(BYPASS_API_ZIP)) && echo "$(BYPASS_API_ZIP) exists") || (echo "$(BYPASS_API_ZIP) does NOT exist") 

is-sskcp-api-existed:
	((test -d $(SSKCP_API)) && echo "$(SSKCP_API) exists") || (echo "$(SSKCP_API) does NOT exist") 
	((test -e $(SSKCP_API_ZIP)) && echo "$(SSKCP_API_ZIP) exists") || (echo "$(SSKCP_API_ZIP) does NOT exist") 

.PHONY: is-info-existed is-info-valid
is-info-valid: $(POWTER_CLIENT_INFO)
ifdef INFO
	./confmgr.py validate --info $(INFO)
else
	./confmgr.py validate --info $(POWTER_CLIENT_INFO)
endif

is-info-existed:
	((test -e $(POWTER_CLIENT_INFO)) && echo "$(POWTER_CLIENT_INFO) exists") || (echo "$(POWTER_CLIENT_INFO) does NOT exist") 

.PHONY: test-files
test-files: test-dns test-bypass test-sskcp is-info-existed

.PHONY: test-dns test-bypass test-sskcp
test-dns: is-dns-image-existed is-dns-confgen-existed is-dns-api-existed
test-bypass: is-bypass-image-existed is-bypass-confgen-existed is-bypass-api-existed
test-sskcp: is-sskcp-image-existed is-sskcp-confgen-existed is-sskcp-api-existed



.PHONY: test-config test-restore
test-config: $(POWTER_CLIENT_CONF)
	tree $(POWTER_CLIENT_CONF)

test-restore: $(POWTER_CLIENT_CONF)
	((test -d $(POWTER_CLIENT_CONF)/dnsconf) && echo "$(POWTER_CLIENT_CONF)/dnsconf exists") || (echo "$(POWTER_CLIENT_CONF)/dnsconf does NOT exist") 
	((test -d $(POWTER_CLIENT_CONF)/bypassconf) && echo "$(POWTER_CLIENT_CONF)/bypassconf exists") || (echo "$(POWTER_CLIENT_CONF)/bypassconf does NOT exist") 
	((test -d $(POWTER_CLIENT_CONF)/sskcpconf) && echo "$(POWTER_CLIENT_CONF)/sskcpconf exists") || (echo "$(POWTER_CLIENT_CONF)/sskcpconf does NOT exist") 


