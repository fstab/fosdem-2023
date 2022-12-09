FROM openjdk:11.0.15-slim

WORKDIR /app
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl unzip
COPY . .
RUN mkdir downloads
RUN mkdir bin
RUN  ./install-all.sh

FROM openjdk:11.0.15-jre-slim
RUN apt-get update && apt-get upgrade -y && apt-get install -y vim curl procps
WORKDIR /app
COPY --from=0 /app/bin ./bin/
COPY versions.sh ./
COPY run-*.sh ./
COPY config-*.yaml ./
COPY config-grafana.ini ./
COPY red-dashboard.json ./
RUN mkdir logs
# 3000 -> Grafana
EXPOSE 3000
# 8080 -> hello world app
EXPOSE 8080
# 8081 -> greeting service
EXPOSE 8081
# 9464 -> hello world app metrics
EXPOSE 9464
# 9465 -> greeting service metrics
EXPOSE 9465
# 9009 -> Mimir HTTP interface
EXPOSE 9009
CMD ./run-all.sh
