CONFIG_ENV=${CURDIR}/config.env

include ${CONFIG_ENV}

## download dns
.PHONY: dl_dns_api dl_dns_confgen dl_dns_image download_dns
dl_dns_api:
	wget $(DNS_API_URL)
	unzip $(DNS_API_ZIP)

dl_dns_confgen:
	wget $(DNS_CONFGEN_URL)	
	unzip $(DNS_CONFGEN_ZIP) 

dl_dns_image:
	docker pull $(DNS_IMAGE)
	docker images | grep dnsmasq

download_dns: dl_dns_api dl_dns_confgen dl_dns_image

## download bypass
.PHONY: dl_bypass_api dl_bypass_confgen dl_bypass_image download_bypass
dl_bypass_api:
	wget $(BYPASS_API_URL) 
	unzip $(BYPASS_API_ZIP) 

dl_bypass_image:
	docker pull $(BYPASS_IMAGE)
	docker images | grep bypass

dl_bypass_confgen:
	wget $(BYPASS_CONFGEN_URL) 
	unzip $(BYPASS_CONFGEN_ZIP)

download_bypass: dl_bypass_api dl_bypass_confgen dl_bypass_image

## download sskcp
.PHONY: dl_sskcp_api dl_sskcp_confgen dl_sskcp_image download_sskcp
dl_sskcp_api:
	wget $(SSKCP_API_URL) 
	unzip $(SSKCP_API_ZIP)

dl_sskcp_image:
	docker pull $(SSKCP_IMAGE)
	docker images | grep sskcp

dl_sskcp_confgen:
	wget $(SSKCP_CONFGEN_URL) 
	unzip $(SSKCP_CONFGEN_ZIP)

download_sskcp: dl_sskcp_api dl_sskcp_confgen dl_sskcp_image


# Download the project
download_apis: dl_dns_api dl_bypass_api dl_sskcp_api
download_images: dl_dns_image dl_bypass_image dl_sskcp_image
download_confgens: dl_dns_confgen dl_bypass_confgen dl_sskcp_confgen
prepare: download_apis download_confgens download_images

