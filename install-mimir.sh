#!/bin/bash

set -e

source versions.sh

if [[ ! -f downloads/mimir-linux-amd64 ]] ; then
    cd downloads
    echo downloading mimir-linux-amd64
    curl -sOL "https://github.com/grafana/mimir/releases/download/mimir-$MIMIR_VERSION/mimir-linux-amd64"
    cd ..
fi

if [[ ! -x bin/mimir-linux-amd64 ]] ; then
    cp downloads/mimir-linux-amd64 bin
    chmod 755 bin/mimir-linux-amd64
    cd ..
fi
