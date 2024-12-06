# Avalanche Node and CLI Setup
This project sets up an Avalanche node and CLI environment using Docker Compose. The setup includes:

1. **Avalanche Node**: Runs a full Avalanche node.
1. **Avalanche CLI**: Provides tools for managing subnets and blockchains.

### Prerequisites
- Docker
- Docker Compose

### Getting Started
##### Clone the repository
```bash
git clone <repository-url>
cd <repository-directory>
```
##### Build and Start the Services
To start the Avalanche Node and CLI:
```bash
docker-compose up --build -d
```
##### Directory Structure
- `config/`: Contains configuration files for the Avalanche Node.
- `data/`: Stores the blockchain data.
- `cli-data/`: Persistent storage for Avalanche CLI.

### Services Overview
##### Avalanche Node
- Provides the core functionality for running an Avalanche blockchain node.
- Accessible at:
    - **Port 9650**: API
    - **Port 9651**: Peering

##### Avalanche CLI
- Used to create and manage subnets, blockchains, and validators.
- Access via:
```bash
docker exec -it avalanche-cli /bin/bash
```

### Common Commands
##### Check Node Status
To check the status of the Avalanche node:
```bash
curl -X POST --data '{"jsonrpc":"2.0","method":"info.isBootstrapped","params":{"chain":"C"},"id":1}' -H 'content-type:application/json;' http://localhost:9650/ext/info
```
##### Access CLI
To open a bash shell in the CLI container:
```bash
docker exec -it avalanche-cli /bin/bash
```

##### Create a Subnet
To create a new subnet:
```bash
avalanche subnet create my-subnet
```

##### Deploy a Subnet
To deploy a subnet on the Fuji testnet:
```bash
avalanche subnet deploy my-subnet --fuji
```

##### Stop the Services
To stop all services:
```bash
docker-compose down
```

### Quick Start with Makefile
1. Start all services:
```bash
make up
```

2. Access Avalanche CLI:
```bash
make cli
```

3. Check the node status:
```bash
make status
```

4. Create and deploy a subnet:
```bash
make create-subnet
make deploy-subnet
```

5. Stop all services:
```bash
make down
```