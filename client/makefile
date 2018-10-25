
CONFIG_PKG=${CURDIR}
CONFIG_ENV=${CONFIG_PKG}/config.env

include ${CONFIG_ENV}

SHELL=/bin/bash

# Project stracture 
Powter_DNS = ${CURDIR}/dnsmasq-imageAPI-$(ARCH)
Powter_SSKCP = ${CURDIR}/sskcp-client-$(ARCH)
Powter_BYPASS = ${CURDIR}/bypass-imageAPI-$(ARCH)

# Download the project
## download dns
.PHONY: download_dns_api download_dns_image download_dns
download_dns_api:
	wget https://github.com/elespejo/dnsmasq/releases/download/$(DNS_VERSION)/dnsmasq-$(ARCH)-$(DNS_VERSION).zip
	unzip dnsmasq-$(ARCH)-$(DNS_VERSION).zip

download_dns_image:
	docker pull elespejo/dnsmasq-$(ARCH):$(DNS_VERSION)
	docker images | grep dnsmasq

download_dns: download_dns_api download_dns_image

## download sskcp
.PHONY: download_sskcp_api download_sskcp_image download_sskcp
download_sskcp_api:
	wget https://github.com/elespejo/sskcp/releases/download/$(SSKCP_VERSION)/sskcp-client-$(ARCH)-$(SSKCP_VERSION).zip
	unzip sskcp-client-$(ARCH)-$(SSKCP_VERSION).zip

download_sskcp_image:
	docker pull elespejo/sskcp-$(ARCH):$(SSKCP_VERSION)
	docker images | grep sskcp

download_sskcp: download_sskcp_api download_sskcp_image

## download bypass
.PHONY: download_bypass_api download_bypass_image download_bypass
download_bypass_api:
	wget https://github.com/elespejo/bypass/releases/download/$(BYPASS_VERSION)/bypass-$(ARCH)-$(BYPASS_VERSION).zip
	unzip bypass-$(ARCH)-$(BYPASS_VERSION).zip

download_bypass_image:
	docker pull elespejo/bypass-$(ARCH):$(BYPASS_VERSION)
	docker images | grep bypass

download_bypass: download_bypass_api download_bypass_image

## download
download_api: download_dns_api download_sskcp_api download_bypass_api
download_image: download_dns_image download_sskcp_image download_bypass_image
download: download_api download_image


# Generate compose file
.PHONY: config_dns config_sskcp config_bypass config

config_dns: $(Powter_DNS) $(DNS_CONFIG)
	make -C $(Powter_DNS) config CONF=$(DNS_CONFIG) LOG=$(DNS_LOG) NAME=dns

config_sskcp: $(Powter_SSKCP) $(SSKCP_CONFIG)
	for (( num=0; num < $(NUMBER); num++ )); \
	do \
		port=$$[$(BASE_PORT)+10*$$num]; \
		make -C $(Powter_SSKCP) config CONF=$(SSKCP_CONFIG)/$$port LOG=$(SSKCP_LOG)/$$port NAME=$$port; \
	done

config_bypass: $(Powter_BYPASS) $(BYPASS_CONFIG) 
	make -C $(Powter_BYPASS) config LAN=$(LAN) BASE_PORT=$(BASE_PORT) NUM=$(NUMBER) CONF=$(BYPASS_CONFIG) NAME=bypass

config: config_dns config_sskcp config_bypass


# Check status
.PHONY: status_dns status_sskcp status_bypass status

status_dns: ${Powter_DNS} 
	make -C ${Powter_DNS} status NAME=dns

status_sskcp: ${Powter_SSKCP} 
	for (( num=0; num < $(NUMBER); num++ )); \
	do \
		port=$$[$(BASE_PORT)+10*$$num]; \
		make -C $(Powter_SSKCP) status NAME=$$port; \
	done

status_bypass: ${Powter_BYPASS} 
	make -C ${Powter_BYPASS} status NAME=bypass

status: status_dns status_sskcp status_bypass

# Start service
.PHONY: start_dns start_sskcp start_bypass start

start_dns: ${Powter_DNS} ${DNS_CONFIG} 
	make -C ${Powter_DNS} start NAME=dns

start_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} 
	for (( num=0; num < $(NUMBER); num++ )); \
	do \
		port=$$[$(BASE_PORT)+10*$$num]; \
		make -C $(Powter_SSKCP) start NAME=$$port; \
	done

start_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} start NAME=bypass 

start: start_dns start_sskcp start_bypass

# Restart service
.PHONY: restart_dns restart_sskcp restart_bypass restart

restart_dns: ${Powter_DNS} ${DNS_CONFIG} 
	make -C ${Powter_DNS} restart NAME=dns 

restart_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} 
	for (( num=0; num < $(NUMBER); num++ )); \
	do \
		port=$$[$(BASE_PORT)+10*$$num]; \
		make -C $(Powter_SSKCP) restart NAME=$$port; \
	done

restart_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} restart NAME=bypass

restart: restart_dns restart_sskcp restart_bypass

# Stop service
.PHONY: stop_dns stop_sskcp stop_bypass stop

stop_dns: ${Powter_DNS} 
	make -C ${Powter_DNS} stop NAME=dns

stop_sskcp: ${Powter_SSKCP} 
	for (( num=0; num < $(NUMBER); num++ )); \
	do \
		port=$$[$(BASE_PORT)+10*$$num]; \
		make -C $(Powter_SSKCP) stop NAME=$$port; \
	done

stop_bypass: ${Powter_BYPASS} 
	make -C ${Powter_BYPASS} stop NAME=bypass 

stop: stop_dns stop_sskcp stop_bypass

# Remove compose file
.PHONY: remove_dns remove_sskcp remove_bypass remove
remove_dns:
	rm -r $(Powter_DNS)/compose

remove_sskcp:
	rm -r $(Powter_SSKCP)/compose

remove_bypass:
	rm -r $(Powter_BYPASS)/compose

remove: remove_dns remove_sskcp remove_bypass
