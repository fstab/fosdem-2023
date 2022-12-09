#!/bin/bash

set -e

export OTEL_SERVICE_NAME=greeting-service
export OTEL_TRACES_EXPORTER=otlp
export OTEL_METRICS_EXPORTER=prometheus
export OTEL_EXPORTER_PROMETHEUS_PORT=9465 # the default 9464 is taken by the hello-world-app
export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://localhost:4017

LOGFILE=logs/$(date '+%Y-%m-%d')-greeting-service.log

echo >> "$LOGFILE"
echo "$(date)" >> "$LOGFILE"
echo >> "$LOGFILE"

java -Dotel.javaagent.debug=true \
     -Dotel.experimental.sdk.metrics.debug=true \
     -Dotel.javaagent.extensions=./bin/otel-configuration-1.0.0-SNAPSHOT.jar \
     -javaagent:./bin/opentelemetry-javaagent.jar \
     -jar ./bin/greeting-service-1.0.0-SNAPSHOT.jar 2>&1 | tee -a "$LOGFILE"
