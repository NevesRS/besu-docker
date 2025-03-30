# Blockchain Besu Network

Este repositório configura uma rede blockchain usando Hyperledger Besu. Os serviços são orquestrados via Docker Compose para facilitar a implantação.

## Requisitos
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Como rodar
Clone o repositório:
```sh
git clone https://github.com/NevesRS/besu-docker.git
cd besu-docker
```

Construa e suba os contêineres em segundo plano:
```sh
docker-compose up -d --build
```

Isso criará:
- **Quatro nós Besu** configurados para se conectarem automaticamente
- **Um contêiner de configuração** para definir permissões e conexões entre os nós
- **Uma rede Docker interna (`besu-net`)**

- Observação:
- **A REDE ESTARÁ DISPONÍVEL NAS PORTAS LOCAIS 8545, 8546, 8547 E 8548, É POSSÍVEL ESCOLHER QUALQUER UMA DELAS PARA ENVIAR O CONTRATO JÁ QUE TODAS ESTÃO CONECTADAS DE FORMA P2P.**

## Como verificar os nós
Veja os contêineres rodando:
```sh
docker ps
```

Confira os logs de um nó:
```sh
docker logs -f besu-node1
```

Verifique conexões P2P (8545, 8546, 8547 ou 8548):
```sh
curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8545 
```
0
## Como desligar
```sh
docker-compose down
```
