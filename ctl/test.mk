CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

.PHONY: is-dns-image-existed is-bypass-image-existed is-sskcp-image-existed
is-dns-image-existed: 
	./imageexisted.sh $(DNS_IMAGE) 

is-bypass-image-existed: 
	./imageexisted.sh $(BYPASS_IMAGE)

is-sskcp-image-existed: 
	./imageexisted.sh $(SSKCP_IMAGE)

.PHONY: is-dns-confgen-existed is-bypass-confgen-existed is-sskcp-confgen-existed
is-dns-confgen-existed:
	./existed.sh $(DNS_CONFGEN)
	./existed.sh $(DNS_CONFGEN_ZIP)

is-bypass-confgen-existed:
	./existed.sh $(BYPASS_CONFGEN) 
	./existed.sh $(BYPASS_CONFGEN_ZIP) 

is-sskcp-confgen-existed:
	./existed.sh $(SSKCP_CONFGEN) 
	./existed.sh $(SSKCP_CONFGEN_ZIP) 

.PHONY: is-dns-api-existed is-bypass-api-existed is-sskcp-api-existed
is-dns-api-existed:
	./existed.sh $(DNS_API) 
	./existed.sh $(DNS_API_ZIP) 

is-bypass-api-existed:
	./existed.sh $(BYPASS_API) 
	./existed.sh $(BYPASS_API_ZIP) 

is-sskcp-api-existed:
	./existed.sh $(SSKCP_API) 
	./existed.sh $(SSKCP_API_ZIP) 

.PHONY: is-info-existed is-info-valid
is-info-valid: $(POWTER_CLIENT_INFO)
ifdef INFO
	./confmgr.py validate --info $(INFO)
else
	./confmgr.py validate --info $(POWTER_CLIENT_INFO)
endif

is-info-existed:
	./existed.sh $(POWTER_CLIENT_INFO) 

.PHONY: is-ququed-info-existed is-queued-info-valid
is-queued-info-valid: $(QUEUED_INFO)
	./confmgr.py validate --info $(QUEUED_INFO)

is-queued-info-existed:
	./existed.sh $(QUEUED_INFO)

.PHONY: is-config-existed is-queued-config-existed
is-config-existed:
	./existed.sh $(POWTER_CLIENT_CONF)

is-queued-config-existed:
	./existed.sh $(QUEUED_CONF)

.PHONY: test-files test-client-dir
test-files: test-client-dir test-dns test-bypass test-sskcp is-info-existed
test-client-dir:
	((test -d $(SRC_DIR)) && echo "$(SRC_DIR) exists") || (echo "$(SRC_DIR) does NOT exist") 

.PHONY: test-dns test-bypass test-sskcp
test-dns: is-dns-image-existed is-dns-confgen-existed is-dns-api-existed
test-bypass: is-bypass-image-existed is-bypass-confgen-existed is-bypass-api-existed
test-sskcp: is-sskcp-image-existed is-sskcp-confgen-existed is-sskcp-api-existed

.PHONY: test-config test-queued-config
test-config: is-config-existed
test-queued-config: is-queued-config-existed

.PHONY: test-info test-queued-info
test-info: is-info-existed
test-queued-info: is-queued-info-existed

.PHONY: test-services
test-services:
	docker ps -a | grep powter
