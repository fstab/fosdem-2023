#!/bin/bash

set -e

source versions.sh

if [[ ! -f downloads/grafana-agent-linux-amd64.zip ]] ; then
    cd downloads
    echo downloading grafana-agent-linux-amd64.zip
    curl -sOL "https://github.com/grafana/agent/releases/download/v$AGENT_VERSION/grafana-agent-linux-amd64.zip"
    cd ..
fi

if [[ ! -f bin/grafana-agent-linux-amd64 ]] ; then
    cd bin
    unzip -q ../downloads/grafana-agent-linux-amd64.zip
    cd ..
fi
