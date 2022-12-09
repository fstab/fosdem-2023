#!/bin/bash

LOGFILE=logs/$(date '+%Y-%m-%d')-mimir.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

mkdir -p /tmp/mimir/rules
./bin/mimir-linux-amd64 -config.file=config-mimir.yaml -server.grpc-listen-port=9096 2>&1 | tee -a "$LOGFILE"
