#!/bin/bash

set -e

source versions.sh

if [[ ! -f downloads/agent-linux-amd64.zip ]] ; then
    cd downloads
    echo downloading agent-linux-amd64.zip
    curl -sOL "https://github.com/grafana/agent/releases/download/v$AGENT_VERSION/agent-linux-amd64.zip"
    cd ..
fi

if [[ ! -f bin/agent-linux-amd64 ]] ; then
    cd bin
    unzip -q ../downloads/agent-linux-amd64.zip
    cd ..
fi
