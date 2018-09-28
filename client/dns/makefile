
DNS_CONFIG = ${CURDIR}/dns_conf
DNS_LOG = ${CURDIR}/dns_log
ARCH = x86

COMPOSE_FILE = ${CURDIR}/dns-x86.yml
ENV_FILE = ${CURDIR}/.env

.PHONY: set_dns_env
set_dns_env:
	touch ${ENV_FILE}
	echo "ARCH=${ARCH}" > ${ENV_FILE}
	echo "DNS_CONFIG=${DNS_CONFIG}" >> ${ENV_FILE}
	echo "DNS_LOG=${DNS_LOG}" >> ${ENV_FILE}
	mkdir -p ${DNS_LOG}

.PHONY: dns_start
dns_start: ${COMPOSE_FILE} set_dns_env
	docker-compose -f ${COMPOSE_FILE} up -d --force-recreate

.PHONY: dns_stop
dns_stop: ${COMPOSE_FILE} ${ENV_FILE}
	docker-compose -f ${COMPOSE_FILE} down
	rm ${ENV_FILE}

.PHONY: dns_restart
dns_restart: ${COMPOSE_FILE} ${ENV_FILE} dns_stop dns_start

.PONHY: dns_status
dns_status: ${COMPOSE_FILE}
	docker-compose -f ${COMPOSE_FILE} ps
	docker-compose -f ${COMPOSE_FILE} logs
	sudo netstat -tunpl | grep dnsmasq
	sudo netstat -tunpl | grep dhclient
	nslookup www.baidu.com 127.0.0.1
	nslookup www.youtube.com 127.0.0.1
