CONFIG_ENV=${CURDIR}/setting.env

include ${CONFIG_ENV}

## download dns
.PHONY: dl-dns-api dl-dns-confgen dl-dns-image download-dns
dl-dns-api:
	cd $(SRC_DIR) && wget $(DNS_API_URL) && unzip $(DNS_API_ZIP) 

dl-dns-confgen:
	cd $(SRC_DIR) && wget $(DNS_CONFGEN_URL) && unzip $(DNS_CONFGEN_ZIP) 

dl-dns-image:
	docker pull $(DNS_IMAGE)
	docker images | grep dnsmasq

download-dns: dl-dns-api dl-dns-confgen dl-dns-image

## download bypass
.PHONY: dl-bypass-api dl-bypass-confgen dl-bypass-image download-bypass
dl-bypass-api:
	cd $(SRC_DIR) && wget $(BYPASS_API_URL) && unzip $(BYPASS_API_ZIP) 

dl-bypass-confgen:
	cd $(SRC_DIR) && wget $(BYPASS_CONFGEN_URL) && unzip $(BYPASS_CONFGEN_ZIP)

dl-bypass-image:
	docker pull $(BYPASS_IMAGE)
	docker images | grep bypass

download-bypass: dl-bypass-api dl-bypass-confgen dl-bypass-image

## download sskcp
.PHONY: dl-sskcp-api dl-sskcp-confgen dl-sskcp-image download-sskcp
dl-sskcp-api:
	cd $(SRC_DIR) && wget $(SSKCP_API_URL) && unzip $(SSKCP_API_ZIP)

dl-sskcp-confgen:
	cd $(SRC_DIR) && wget $(SSKCP_CONFGEN_URL) && unzip $(SSKCP_CONFGEN_ZIP)

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

resetinfo: geninfo

.PHONY: create-client
create-client:
	mkdir client
.PHONY: prepare
prepare: create-client download-apis download-confgens download-images geninfo

