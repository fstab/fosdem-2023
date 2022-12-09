#!/bin/bash

set -e

source versions.sh

if [[ ! -f downloads/tempo_${TEMPO_VERSION}_linux_amd64.tar.gz ]] ; then
    cd downloads
    echo downloading tempo_${TEMPO_VERSION}_linux_amd64.tar.gz
    curl -sLO https://github.com/grafana/tempo/releases/download/v${TEMPO_VERSION}/tempo_${TEMPO_VERSION}_linux_amd64.tar.gz
    cd ..
fi

if [[ ! -x bin/tempo ]] ; then
    cd bin
    tar xfz ../downloads/tempo_${TEMPO_VERSION}_linux_amd64.tar.gz tempo
    cd ..
fi
