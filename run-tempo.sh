#!/bin/bash

LOGFILE=logs/$(date '+%Y-%m-%d')-tempo.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

./bin/tempo -config.file config-tempo.yaml 2>&1 | tee -a "$LOGFILE"
