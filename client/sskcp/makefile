
SSKCP_CONFIG=${CURDIR}/sskcp_conf
SSKCP_LOG=${CURDIR}/sskcp_log

ARCH=x86
NUMBER=4
BASE_PORT=1000
SSKCP_VERSION=latest

SERVICE_TEMPLATE=${CURDIR}/sskcp-service.yml
COMPOSE_FILE=${CURDIR}/sskcp-x86.yml
ENV_FILE=${CURDIR}/.env

SHELL=/bin/bash # used in for loop in generate_compose

.PHONY: set_sskcp_env
set_sskcp_env:
	touch ${ENV_FILE}
	echo "ARCH=${ARCH}" > ${ENV_FILE}
	echo "SSKCP_VERSION=${SSKCP_VERSION}" >> ${ENV_FILE}
	echo "SSKCP_CONFIG=${SSKCP_CONFIG}" >> ${ENV_FILE}
	echo "SSKCP_LOG=${SSKCP_LOG}" >> ${ENV_FILE}

generate_compose:
	touch ${COMPOSE_FILE}
	echo "version: '3.7'" > ${COMPOSE_FILE}
	echo "services:" >> ${COMPOSE_FILE}
	for i in {1..${NUMBER}}; \
	do \
		cat ${SERVICE_TEMPLATE} >> ${COMPOSE_FILE}; \
		let PORT=($$i-1)*10+${BASE_PORT}; \
		sed -i "s/-PORT-/$$PORT/g" ${COMPOSE_FILE}; \
		mkdir -p ${SSKCP_LOG}/$$PORT; \
	done

.PHONY: sskcp_start
sskcp_start: set_sskcp_env generate_compose
	sleep 3
	docker-compose -f ${COMPOSE_FILE} up -d --force-recreate

.PHONY: sskcp_stop
sskcp_stop: ${COMPOSE_FILE} ${ENV_FILE}
	docker-compose -f ${COMPOSE_FILE} down
	rm ${COMPOSE_FILE}
	rm ${ENV_FILE}

.PHONY: sskcp_restart
sskcp_restart: ${COMPOSE_FILE} ${ENV_FILE} sskcp_stop sskcp_start

.PONHY: sskcp_status
sskcp_status:
	docker-compose -f ${COMPOSE_FILE} ps
	docker-compose -f ${COMPOSE_FILE} logs
	sudo netstat -tunpl | grep ss-redir
	sudo netstat -tunpl | grep client
