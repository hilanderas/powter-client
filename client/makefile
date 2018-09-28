
POWTER_ENV = ${CURDIR}/powter.env
CONFIG_PKG = ${CURDIR}
CONFIG_ENV = ${CONFIG_PKG}/config.env

include ${POWTER_ENV}
include ${CONFIG_ENV}

# Check status
.PHONY: status_dns status_sskcp status_bypass status

status_dns: ${Powter_DNS} ${Powter_DNS}/.env
	make -C ${Powter_DNS} dns_status

status_sskcp: ${Powter_SSKCP} ${Powter_SSKCP}/.env
	make -C ${Powter_SSKCP} sskcp_status

status_bypass: ${Powter_BYPASS} ${Powter_BYPASS}/.env
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

stop_dns: ${Powter_DNS} ${Powter_DNS}/.env
	make -C ${Powter_DNS} dns_stop 

stop_sskcp: ${Powter_SSKCP} ${Powter_SSKCP}/.env
	make -C ${Powter_SSKCP} sskcp_stop

stop_bypass: ${Powter_BYPASS} ${Powter_BYPASS}/.env
	make -C ${Powter_BYPASS} bypass_stop 

stop: stop_dns stop_sskcp stop_bypass