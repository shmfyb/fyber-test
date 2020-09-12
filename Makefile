up:
	docker-compose up

down:
	docker-compose down

join:
	docker exec  agent consul agent -enable-local-script-checks  -client=0.0.0.0 -retry-join  server -data-dir=/consul/data -config-dir=/consul/consul.d -node=agent

proxy-app:
	docker exec agent consul connect proxy -sidecar-for agent


proxy-web:
	docker exec  agent consul connect proxy -sidecar-for web

jenkins:
	./init.sh