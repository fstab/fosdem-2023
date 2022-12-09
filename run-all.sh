#!/bin/bash

(./run-agent.sh > /dev/null 2>&1 || echo "agent terminated") &
(./run-grafana.sh > /dev/null 2>&1 || echo "grafana terminated") &
(./run-greeting-service.sh > /dev/null 2>&1 || echo "greeting service terminated") &
(./run-hello-world-app.sh > /dev/null 2>&1 || echo "hello world app terminated") &
(./run-loki.sh > /dev/null 2>&1 || echo "loki terminated") &
(./run-mimir.sh > /dev/null 2>&1 || echo "mimir terminated") &
(./run-tempo.sh > /dev/null 2>&1 || echo "tempo terminated") &
(./run-client.sh  > /dev/null 2>&1 || echo "curl client terminated") &

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

echo 'HTTP Ports:'
echo '  * 3000: Grafana (log in with admin/admin)'
echo '  * 8080: hello world app'
echo '  * 8081: greeting service'
echo '  * 9464: hello world app metrics'
echo '  * 9465: greeting service metrics'
echo '  * 9009: Mimir Web interface'
echo 'Data Sources:'
echo '  * http://localhost:9009/prometheus: Prometheus (Mimir)'
echo '  * http://localhost:3200: Tempo'
echo '  * http://localhost:3100: Loki'

sleep infinity
