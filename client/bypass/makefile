
BYPASS_CONFIG = ${CURDIR}/bypass_conf
NUMBER = 4
BASE_PORT = 1000
LAN = br0
ARCH = x86

COMPOSE_FILE = ${CURDIR}/bypass-x86.yml
ENV_FILE = ${CURDIR}/.env 

.PHONY: set_bypass_env
set_bypass_env:
	touch ${ENV_FILE}
	echo "ARCH=${ARCH}" > ${ENV_FILE}
	echo "BYPASS_CONFIG=${BYPASS_CONFIG}" >> ${ENV_FILE}
	
	touch ${BYPASS_CONFIG}/bypass.env
	echo "LAN=${LAN}" > ${BYPASS_CONFIG}/bypass.env
	echo "BALANCE_NUM=${NUMBER}" >> ${BYPASS_CONFIG}/bypass.env
	echo "BASE_PORT=${BASE_PORT}" >> ${BYPASS_CONFIG}/bypass.env

.PHONY: bypass_start
bypass_start: ${COMPOSE_FILE} set_bypass_env
	docker-compose -f ${COMPOSE_FILE} up -d --force-recreate

.PHONY: bypass_stop
bypass_stop: ${COMPOSE_FILE} ${ENV_FILE}
	docker-compose -f ${COMPOSE_FILE} exec router_bypass ./clean-rule
	docker-compose -f ${COMPOSE_FILE} exec router_bypass ./clean-ipset
	docker-compose -f ${COMPOSE_FILE} down
	rm ${BYPASS_CONFIG}/bypass.env
	rm ${ENV_FILE}

.PHONY: bypass_restart
bypass_restart: ${COMPOSE_FILE} ${ENV_FILE} bypass_stop bypass_start

.PHONY: bypass_status
bypass_status: ${COMPOSE_FILE}
	docker-compose -f ${COMPOSE_FILE} ps
	docker-compose -f ${COMPOSE_FILE} logs
	sudo iptables -t nat -S
	sudo ipset list -n