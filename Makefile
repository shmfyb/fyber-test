up:
	docker-compose up

down:
	docker-compose down

connect:
	docker exec -d agent consul agent -enable-local-script-checks  -client=0.0.0.0 -retry-join  server -data-dir=/consul/data -config-dir=/consul/consul.d -node=agent \
    sleep 30 \
    echo "connect proxys" \
    docker exec -d agent consul connect proxy -sidecar-for flask \
    docker exec -d agent consul connect proxy -sidecar-for web