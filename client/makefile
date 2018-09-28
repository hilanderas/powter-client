
POWTER_ENV = ${CURDIR}/powter.env 
CONFIG_ENV = ${CURDIR}/config.env

include ${POWTER_ENV}
include ${CONFIG_ENV}

# Check status
.PHONY: status_dns status_sskcp status_bypass status

status_dns: ${Powter_DNS} ${DNS_CONFIG} ${DNS_LOG}
	make -C ${Powter_DNS} \
		dns_status \
		DNS_CONFIG=${DNS_CONFIG} \
		DNS_LOG=${DNS_LOG} \
		ARCH=${ARCH}

status_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} ${SSKCP_LOG}
	make -C ${Powter_SSKCP} \
		sskcp_status \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		ARCH=${ARCH}

status_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_status \
		BYPASS_CONFIG=${BYPASS_CONFIG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		LAN=${LAN} \
		ARCH=${ARCH}

status: status_dns status_sskcp status_bypass

# Start service
.PHONY: start_dns start_sskcp start_bypass start

start_dns: ${Powter_DNS} ${DNS_CONFIG} 
	make -C ${Powter_DNS} \
		dns_start \
		DNS_CONFIG=${DNS_CONFIG} \
		DNS_LOG=${DNS_LOG} \
		ARCH=${ARCH}

start_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} 
	make -C ${Powter_SSKCP} \
		sskcp_start \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		ARCH=${ARCH}

start_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_start \
		BYPASS_CONFIG=${BYPASS_CONFIG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		LAN=${LAN} \
		ARCH=${ARCH}

start: start_dns start_sskcp start_bypass

# Restart service
.PHONY: restart_dns restart_sskcp restart_bypass restart

restart_dns: ${Powter_DNS} ${DNS_CONFIG} ${DNS_LOG}
	make -C ${Powter_DNS} \
		dns_restart \
		DNS_CONFIG=${DNS_CONFIG} \
		DNS_LOG=${DNS_LOG} \
		ARCH=${ARCH}

restart_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} ${SSKCP_LOG}
	make -C ${Powter_SSKCP} \
		sskcp_restart \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		ARCH=${ARCH}

restart_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_restart \
		BYPASS_CONFIG=${BYPASS_CONFIG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		LAN=${LAN} \
		ARCH=${ARCH}

restart: restart_dns restart_sskcp restart_bypass

# Stop service
.PHONY: stop_dns stop_sskcp stop_bypass stop

stop_dns: ${Powter_DNS} ${DNS_CONFIG} ${DNS_LOG}
	make -C ${Powter_DNS} \
		dns_stop \
		DNS_CONFIG=${DNS_CONFIG} \
		DNS_LOG=${DNS_LOG} \
		ARCH=${ARCH}

stop_sskcp: ${Powter_SSKCP} ${SSKCP_CONFIG} ${SSKCP_LOG}
	make -C ${Powter_SSKCP} \
		sskcp_stop \
		SSKCP_CONFIG=${SSKCP_CONFIG} \
		SSKCP_LOG=${SSKCP_LOG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		ARCH=${ARCH}

stop_bypass: ${Powter_BYPASS} ${BYPASS_CONFIG}
	make -C ${Powter_BYPASS} \
		bypass_stop \
		BYPASS_CONFIG=${BYPASS_CONFIG} \
		NUMBER=${NUMBER} \
		BASE_PORT=${BASE_PORT} \
		LAN=${LAN} \
		ARCH=${ARCH}

stop: stop_dns stop_sskcp stop_bypass