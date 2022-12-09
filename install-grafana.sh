#!/bin/bash

set -e

source versions.sh

if [[ ! -f downloads/grafana-$GRAFANA_VERSION.linux-amd64.tar.gz ]] ; then
    cd downloads
    echo downloading grafana-$GRAFANA_VERSION.linux-amd64.tar.gz
    curl -sOL https://dl.grafana.com/oss/release/grafana-$GRAFANA_VERSION.linux-amd64.tar.gz
    cd ..
fi


if [[ ! -d bin/grafana-$GRAFANA_VERSION ]] ; then
    cd bin
    tar xfz ../downloads/grafana-$GRAFANA_VERSION.linux-amd64.tar.gz
    cd ..
fi

if [[ ! -f bin/grafana-$GRAFANA_VERSION/conf/provisioning/datasources/datasources.yaml ]] ; then
    cp grafana-datasources.yaml bin/grafana-$GRAFANA_VERSION/conf/provisioning/datasources/datasources.yaml
fi

if [[ ! -f bin/grafana-$GRAFANA_VERSION/conf/provisioning/dashboards/dashboards.yaml ]] ; then
    cp grafana-dashboards.yaml bin/grafana-$GRAFANA_VERSION/conf/provisioning/dashboards/dashboards.yaml
fi
