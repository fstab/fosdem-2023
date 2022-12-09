# Application Monitoring with Grafana and OpenTelemetry

This is the demo for my [FOSDEM'23 talk on Application Monitoring with Grafana and OpenTelemetry](https://fosdem.org/2023/schedule/event/apm/).

You can run it in Docker:

```
./run-docker.sh
```

Log in to Grafana on [http://localhost:3000](http://localhost:3000) with username _admin_ and password _admin_.

Alternatively, you can run the demo without Docker:

```
./install-all.sh
./run-all.sh
```

# Title

Application Monitoring with Grafana and OpenTelemetry

# Slides

[https://docs.google.com/presentation/d/1fkHZUi54Xc_EORgcbr1saWyznxykeagamWpTyqAENbA/edit?usp=sharing](https://docs.google.com/presentation/d/1fkHZUi54Xc_EORgcbr1saWyznxykeagamWpTyqAENbA/edit?usp=sharing)

# Video

_TODO_

# Abstract

OpenTelemetry is a collection of standards and tools to make it easy to get metrics, distributed traces, and logs out of applications. For example, OpenTelemetry's Java agent will instrument Java applications out-of-the-box, with no code change required.

This talk shows how to use these signals for application monitoring. We will introduce Grafana's open source databases: Loki for logs, Tempo for traces, and Mimir for metrics. And we will show how to use Grafana to explore the telemetry data for an example application running on Kubernetes.

Grafana and Prometheus metrics have been popular among platform engineers for monitoring Kubernetes clusters for a long time.

this talk will show how application developers can benefit from Grafana as well, using open standards like OpenTelemetry, and open source monitoring backends like Loki, Tempo, and Mimir.

# Bio

Dr. Fabian Stäber is engineering manager and monitoring enthusiast at Grafana. He is a member of the Prometheus open source project, where he is maintainer of the Prometheus Java client library and the JMX exporter. At Grafana Fabian has his focus on application monitoring with OpenTelemetry.
