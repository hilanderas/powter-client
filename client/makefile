
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
	make -C ${Powter_DNS} dns_status

status_sskcp: ${Powter_SSKCP} 
	make -C ${Powter_SSKCP} sskcp_status

status_bypass: ${Powter_BYPASS} 
	make -C ${Powter_BYPASS} bypass_status

status: status_dns status_sskcp status_bypass

# Start service
.PHONY: start_dns start_sskcp start_bypass start

start_dns: ${Powter_DNS} ${DNS_CONFIG} 
	make -C ${Powter_DNS} \
		dns_start \
		ARCH=${ARCH} \
		DNS_VERSION=${DNS_VERSION} \
		DNS_LOG=${DNS_LOG} \
		DNS_CONFIG=${DNS_CONFIG} 		

start_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} 
	make -C ${Powter_SSKCP} \
		sskcp_start \
		ARCH=${ARCH} \
		SSKCP_VERSION=${SSKCP_VERSION} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG} 

start_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_start \
		ARCH=${ARCH} \
		BYPASS_VERSION=${BYPASS_VERSION} \
		LAN=${LAN} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		BYPASS_CONFIG=${BYPASS_CONFIG} 

start: start_dns start_sskcp start_bypass

# Restart service
.PHONY: restart_dns restart_sskcp restart_bypass restart

restart_dns: ${Powter_DNS} ${DNS_CONFIG} ${DNS_LOG}
	make -C ${Powter_DNS} \
		dns_restart \
		ARCH=${ARCH} \
		DNS_VERSION=${DNS_VERSION} \
		DNS_LOG=${DNS_LOG} \
		DNS_CONFIG=${DNS_CONFIG} 

restart_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} ${SSKCP_LOG}
	make -C ${Powter_SSKCP} \
		sskcp_restart \
		ARCH=${ARCH} \
		SSKCP_VERSION=${SSKCP_VERSION} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG}

restart_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_restart \
		ARCH=${ARCH} \
		BYPASS_VERSION=${BYPASS_VERSION} \
		LAN=${LAN} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		BYPASS_CONFIG=${BYPASS_CONFIG}

restart: restart_dns restart_sskcp restart_bypass

# Stop service
.PHONY: stop_dns stop_sskcp stop_bypass stop

stop_dns: ${Powter_DNS} 
	make -C ${Powter_DNS} dns_stop 

stop_sskcp: ${Powter_SSKCP} 
	make -C ${Powter_SSKCP} sskcp_stop

stop_bypass: ${Powter_BYPASS} 
	make -C ${Powter_BYPASS} bypass_stop 

stop: stop_dns stop_sskcp stop_bypass