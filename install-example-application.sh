#!/bin/bash

set -e

if [[ ! -f bin/otel-configuration-1.0.0-SNAPSHOT.jar || ! -f bin/hello-world-app-1.0.0-SNAPSHOT.jar || ! -f bin/greeting-service-1.0.0-SNAPSHOT.jar ]] ; then
    echo installing the example application
    ./mvnw package 2>&1 > /dev/null
    cp otel-configuration/target/otel-configuration-1.0.0-SNAPSHOT.jar bin
    cp hello-world-app/target/hello-world-app-1.0.0-SNAPSHOT.jar bin
    cp greeting-service/target/greeting-service-1.0.0-SNAPSHOT.jar bin
fi
