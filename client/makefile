include ${CURDIR}/powter.env

# Check path exist
.PHONY: set_env
check_env: ${Powter_DNS} ${Powter_SSKCP} ${Powter_BYPASS} ${SSKCP_CONFIG} ${SSKCP_LOG} ${DNS_CONFIG} ${DNS_LOG} ${BYPASS_CONFIG}

# Check status
.PHONY: status
status: check_env
	make -C ${Powter_DNS} dns_status DNS_CONFIG=${DNS_CONFIG} DNS_LOG=${DNS_LOG}
	make -C ${Powter_SSKCP} sskcp_status SSKCP_CONFIG=${SSKCP_CONFIG} SSKCP_LOG=${SSKCP_LOG}
	make -C ${Powter_BYPASS} bypass_status BYPASS_CONFIG=${BYPASS_CONFIG}

# Start service
.PHONY: start
start: check_env
	make -C ${Powter_DNS} dns_start DNS_CONFIG=${DNS_CONFIG} DNS_LOG=${DNS_LOG}
	make -C ${Powter_SSKCP} sskcp_start SSKCP_CONFIG=${SSKCP_CONFIG} SSKCP_LOG=${SSKCP_LOG}
	make -C ${Powter_BYPASS} bypass_start BYPASS_CONFIG=${BYPASS_CONFIG}

# Restart service
.PHONY: restart
restart: check_env
	make -C ${Powter_DNS} dns_restart DNS_CONFIG=${DNS_CONFIG} DNS_LOG=${DNS_LOG}
	make -C ${Powter_SSKCP} sskcp_restart SSKCP_CONFIG=${SSKCP_CONFIG} SSKCP_LOG=${SSKCP_LOG}
	make -C ${Powter_BYPASS} bypass_restart BYPASS_CONFIG=${BYPASS_CONFIG}

# Stop service
.PHONY: stop
stop: check_env
	make -C ${Powter_DNS} dns_stop DNS_CONFIG=${DNS_CONFIG} DNS_LOG=${DNS_LOG}
	make -C ${Powter_SSKCP} sskcp_stop SSKCP_CONFIG=${SSKCP_CONFIG} SSKCP_LOG=${SSKCP_LOG}
	make -C ${Powter_BYPASS} bypass_stop BYPASS_CONFIG=${BYPASS_CONFIG}

