#!/bin/bash
docker build -t local_jenkins docker/jenkins
docker run \
  -p 8080:8080 \
  -p 50000:50000 \
  -v ${PWD}/jenkins_home/:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins \
  local_jenkins
