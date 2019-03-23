#!/bin/sh
mvn clean package && docker build -f Dockerfile.thorntail-hollow -t pingperf-thorntail-hollow .
