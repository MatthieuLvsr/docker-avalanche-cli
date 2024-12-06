# Makefile for managing Avalanche Node and CLI

# Start all services
up:
	docker-compose up --build -d

# Stop all services
down:
	docker-compose down

# Access the Avalanche CLI
cli:
	docker exec -it avalanche-cli /bin/bash

# Check Avalanche Node status
status:
	curl -X POST --data '{"jsonrpc":"2.0","method":"info.isBootstrapped","params":{"chain":"C"},"id":1}' -H 'content-type:application/json;' http://localhost:9650/ext/info

# Create a new subnet
create-subnet:
	docker exec -it avalanche-cli avalanche subnet create my-subnet

# Deploy the subnet on Fuji testnet
deploy-subnet:
	docker exec -it avalanche-cli avalanche subnet deploy my-subnet --fuji
