#!/bin/bash

set -e

./install-agent.sh
./install-grafana.sh
./install-loki.sh
./install-mimir.sh
./install-tempo.sh
./install-opentelemetry-instrumentation.sh
./install-example-application.sh
