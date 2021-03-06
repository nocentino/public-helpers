#!/bin/bash
set -Eeuo pipefail
export DOCKER_REGISTRY="mcr.microsoft.com"
export DOCKER_REPOSITORY="mssql/bdc"
export DOCKER_TAG="2019-CU8-ubuntu-16.04"
export ARCDOCKER_TAG="latest"
#public-preview-sep-2020"
IMAGES=(
	mssql-app-service-proxy
        mssql-control-watchdog
        mssql-controller
        mssql-dns
        mssql-hadoop
        mssql-mleap-serving-runtime
        mssql-mlserver-py-runtime
        mssql-mlserver-r-runtime
        mssql-monitor-collectd
        mssql-monitor-elasticsearch
        mssql-monitor-fluentbit
        mssql-monitor-grafana
        mssql-monitor-influxdb
        mssql-monitor-kibana
        mssql-monitor-telegraf
        mssql-security-knox
        mssql-security-support
        mssql-server-controller
        mssql-server-data
        mssql-ha-operator
		mssql-ha-supervisor
        mssql-service-proxy
        mssql-ssis-app-runtime
)

CUS=(
	CU6
	CU8
)
ARCIMAGES=(
	arc-sqlmi
	arc-controller
	arc-monitor-fluentbit
	arc-monitor-telegraf
	arc-monitor-collectd      
	arc-postgres-12
	arc-server-controller
	arc-service-proxy
	arc-bootstrapper
	arc-control-watchdog
	arc-monitor-kibana
	arc-monitor-elasticsearch
	arc-monitor-grafana
	arc-monitor-influxdb            
)
for cu in "${CUS[@]}";
do
	docker pull $DOCKER_REGISTRY/mssql/server:2019-$cu-ubuntu-18.04
done
for image in "${IMAGES[@]}";
do
    docker pull $DOCKER_REGISTRY/$DOCKER_REPOSITORY/$image:$DOCKER_TAG
done
for arcimage in "${ARCIMAGES[@]}";
do
    docker pull $DOCKER_REGISTRY/arcdata/$arcimage:$ARCDOCKER_TAG
done

