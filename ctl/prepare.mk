CONFIG_ENV=${CURDIR}/setting.env

include $(CONFIG_ENV)


## download dns
.PHONY: dl-dns-api dl-dns-confgen dl-dns-image download-dns
dl-dns-api:
	./dlzip.sh $(DNS_API_ZIP) $(SRC_DIR) $(DNS_API_URL) $(DNS_API)

dl-dns-confgen:
	./dlzip.sh $(DNS_CONFGEN_ZIP) $(SRC_DIR) $(DNS_CONFGEN_URL) $(DNS_CONFGEN)

dl-dns-image:
	docker pull $(DNS_IMAGE)
	docker images | grep dnsmasq

download-dns: dl-dns-api dl-dns-confgen dl-dns-image

## download bypass
.PHONY: dl-bypass-api dl-bypass-confgen dl-bypass-image download-bypass
dl-bypass-api:
	./dlzip.sh $(BYPASS_API_ZIP) $(SRC_DIR) $(BYPASS_API_URL) $(BYPASS_API)  

dl-bypass-confgen:
	./dlzip.sh $(BYPASS_CONFGEN_ZIP) $(SRC_DIR) $(BYPASS_CONFGEN_URL) $(BYPASS_CONFGEN)

dl-bypass-image:
	docker pull $(BYPASS_IMAGE)
	docker images | grep bypass

download-bypass: dl-bypass-api dl-bypass-confgen dl-bypass-image

## download sskcp
.PHONY: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image download-sskcp
dl-sskcp-api:
	./dlzip.sh $(SSKCP_API_ZIP) $(SRC_DIR) $(SSKCP_API_URL) $(SSKCP_API)

dl-sskcp-confgen:
	./dlzip.sh $(SSKCP_CONFGEN_ZIP) $(SRC_DIR) $(SSKCP_CONFGEN_URL) $(SSKCP_CONFGEN) 

dl-sskcp-image:
	docker pull $(SSKCP_IMAGE)
	docker images | grep sskcp

download-sskcp: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image


.PHONY: download-apis download-confgens download-images
# Download the project
download-apis: dl-dns-api dl-bypass-api dl-sskcp-api
download-images: dl-dns-image dl-bypass-image dl-sskcp-image
download-confgens: dl-dns-confgen dl-bypass-confgen dl-sskcp-confgen

.PHONY: geninfo reset-info
geninfo:
	./confmgr.py mergeinfo --dns $(DNS_CONFGEN)/dnsmasq-info.yml --bypass $(BYPASS_CONFGEN)/bypass-info.yml --sskcp $(SSKCP_CONFGEN)/sskcp-client-info.yml --info $(POWTER_CLIENT_INFO) 
	cp $(POWTER_CLIENT_INFO) $(QUEUED_INFO)

resetinfo: geninfo

.PHONY: create-client
create-client:
ifeq (, $(wildcard $(SRC_DIR)))
	mkdir $(SRC_DIR)
endif

.PHONY: prepare
prepare: create-client download-apis download-confgens geninfo download-images 

