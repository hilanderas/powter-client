
BYPASS_CONFIG = ${CURDIR}/bypass_conf
COMPOSE_FILE = ${CURDIR}/bypass-x86.yml
ENV_FILE = ${CURDIR}/.env 

.PHONY: set_bypass_env
set_bypass_env:
	touch ${ENV_FILE}
	echo "BYPASS_CONFIG=${BYPASS_CONFIG}" >> ${ENV_FILE}

.PHONY: bypass_start
bypass_start: ${COMPOSE_FILE} set_bypass_env
	docker-compose -f ${COMPOSE_FILE} up -d --force-recreate

.PHONY: bypass_stop
bypass_stop: ${COMPOSE_FILE} ${ENV_FILE}
	docker-compose -f ${COMPOSE_FILE} exec router_bypass ./clean-rule
	docker-compose -f ${COMPOSE_FILE} exec router_bypass ./clean-ipset
	docker-compose -f ${COMPOSE_FILE} down
	rm ${ENV_FILE}

.PHONY: bypass_restart
bypass_restart: ${COMPOSE_FILE} ${ENV_FILE} bypass_stop bypass_start

.PHONY: bypass_status
bypass_status: ${COMPOSE_FILE}
	docker-compose -f ${COMPOSE_FILE} ps
	docker-compose -f ${COMPOSE_FILE} logs
	sudo iptables -t nat -S
	sudo ipset list -n