
SSKCP_CONFIG = ${CURDIR}/sskcp_conf
SSKCP_LOG = ${CURDIR}/sskcp_log
COMPOSE_FILE = ${CURDIR}/sskcp-x86.yml
ENV_FILE = ${CURDIR}/.env 

.PHONY: set_sskcp_env
set_sskcp_env:
	touch ${ENV_FILE}
	echo "SSKCP_CONFIG=${SSKCP_CONFIG}" > ${ENV_FILE}
	echo "SSKCP_LOG=${SSKCP_LOG}" >> ${ENV_FILE}

.PHONY: sskcp_start
sskcp_start: ${COMPOSE_FILE} set_sskcp_env
	docker-compose -f ${COMPOSE_FILE} up -d --force-recreate

.PHONY: sskcp_stop
sskcp_stop: ${COMPOSE_FILE} ${ENV_FILE}
	docker-compose -f ${COMPOSE_FILE} down
	rm ${ENV_FILE}

.PHONY: sskcp_restart
sskcp_restart: ${COMPOSE_FILE} ${ENV_FILE} sskcp_stop sskcp_start

.PONHY: sskcp_status
sskcp_status:
	docker-compose -f ${COMPOSE_FILE} ps
	docker-compose -f ${COMPOSE_FILE} logs
	sudo netstat -tunpl | grep docker
