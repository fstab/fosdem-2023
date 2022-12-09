#!/bin/bash

set -e

export OTEL_SERVICE_NAME=hello-world-app
export OTEL_TRACES_EXPORTER=otlp
export OTEL_METRICS_EXPORTER=prometheus
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://localhost:4017

LOGFILE=logs/$(date '+%Y-%m-%d')-hello-world-app.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

java -Dotel.javaagent.debug=true \
    -Dotel.javaagent.extensions=./bin/otel-configuration-1.0.0-SNAPSHOT.jar \
    -javaagent:./bin/opentelemetry-javaagent.jar -jar ./bin/hello-world-app-1.0.0-SNAPSHOT.jar 2>&1 | tee -a "$LOGFILE"
