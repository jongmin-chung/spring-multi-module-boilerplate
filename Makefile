-include ./docker-compose/.env

BRIDGE_NETWORK=./docker-compose/bridge-network.yml

COMPOSE_COMMAND=docker-compose -f ${BRIDGE_NETWORK}

# Container
MYSQL=./docker-compose/mysql-compose.yml
POSTGRESQL=./docker-compose/postgresql-compose.yml
REDIS=./docker-compose/redis-compose.yml
PROMETHEUS_GRAFANA=./docker-compose/prometheus-grafana-compose.yml
MONGO=./docker-compose/mongo-compose.yml

mysql-up:
	${COMPOSE_COMMAND} -f ${MYSQL} up -d

postgresql-up:
	${COMPOSE_COMMAND} -f ${POSTGRESQL} up -d

redis-up:
	${COMPOSE_COMMAND} -f ${REDIS} up -d

prometheus-grafana-up:
	${COMPOSE_COMMAND} -f ${PROMETHEUS_GRAFANA} up -d

mongo-up:
	${COMPOSE_COMMAND} -f ${MONGO} up -d

mysql-down:
	${COMPOSE_COMMAND} -f ${MYSQL} down

postgresql-down:
	${COMPOSE_COMMAND} -f ${POSTGRESQL} down

redis-down:
	${COMPOSE_COMMAND} -f ${REDIS} down

prometheus-grafana-down:
	${COMPOSE_COMMAND} -f ${PROMETHEUS_GRAFANA} down

init:
	${COMPOSE_COMMAND} -f ${MYSQL} -f ${REDIS} -f ${PROMETHEUS_GRAFANA} -f ${MONGO} up
