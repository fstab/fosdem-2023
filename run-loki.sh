#!/bin/bash

LOGFILE=logs/$(date '+%Y-%m-%d')-loki.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

./bin/loki-linux-amd64 -config.file=config-loki.yaml -server.grpc-listen-port=9097 2>&1 | tee -a "$LOGFILE"
