agent-reload:
	docker exec agent consul reload

members:
	docker exec server consul members

join-agent:
	docker exec agent consul agent -enable-script-checks -retry-join=server -data-dir=/consul/data -config-dir=/consul/consul.d -node=agent

proxy-flask:
	docker exec agent consul connect proxy -sidecar-for flask

proxy-web:
	docker exec agent consul connect proxy -sidecar-for web

build:
	docker-compose build

up: build
	docker-compose up

down:
	docker-compose down



jenkins:
	docker run \
		-p 8080:8080 \
		-v ${PWD}/jenkins_home/:/var/jenkins_home \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--name jenkins \
		jenkins/jenkins:lts


local_flask_app:
	docker run --rm \
		--name local_flask_app \
		--hostname flask \

		-p 5000:5000 \
		-v /var/run/docker.sock:/var/run/docker.sock \
		local_flask_app

ubuntu_local:
	docker run --rm \
		-it \
		--network "host" \
		--hostname localhost \
		--name ubuntu \
		-v /var/run/docker.sock:/var/run/docker.sock \
		ubuntu_local bash

server_local:
	docker run \
		--rm \
		--dns 8.8.8.8 \
		-p 8500:8500 \
		-p 8600:8600 \
		--hostname server \
		--name=server \
		-v ${PWD}/conf/:/consul/conf \
		-v /var/run/docker.sock:/var/run/docker.sock \
		consul_local2 consul agent -server -ui -bootstrap-expect=1 -client=0.0.0.0 -data-dir=/consul/data -config-dir=/consul/conf -node server

agent_local:
	docker run \
		--hostname agent \
		--name=agent --rm \
		consul_local2 consul agent -enable-local-script-checks  -client=0.0.0.0 -retry-join  $(SERVER_IP) -data-dir=/consul/data -config-dir=/consul/consul.d -node=agent