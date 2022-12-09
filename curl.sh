#!/bin/bash

curl -s -H 'Accept: application/openmetrics-text; version=1.0.0; charset=utf-8' http://localhost:9464/metrics
