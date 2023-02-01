#!/bin/bash

LOGFILE=logs/$(date '+%Y-%m-%d')-ageng.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

./bin/grafana-agent-linux-amd64 --config.file=config-agent.yaml 2>&1 | tee -a "$LOGFILE"
