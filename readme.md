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

## Como desligar
```sh
docker-compose down
```

##É possível acessar o Remix IDE e dar deploy dos contratos, para isso basta seguir as etapas abaixo:
- Crie uma nova rede no metamask
![image](https://github.com/user-attachments/assets/cc9df1e0-22e2-4b24-9e77-db5197c5a05d)

- Configure com os dados da imagem:
![image](https://github.com/user-attachments/assets/e9da8417-ba8f-4a38-9740-c05629eb4256)

- Adicione uma nova conta ao clicar em:
![image](https://github.com/user-attachments/assets/f197e96e-3016-4942-b57c-d0252468ecb0)
![image](https://github.com/user-attachments/assets/baa7f8f2-b190-4ac4-a186-1b0c0249ed10)
![image](https://github.com/user-attachments/assets/4e682957-0d05-430d-97f1-0633974f15a0)
- Adicione a seguinte chave privada, c87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3, no campo abaixo:
![image](https://github.com/user-attachments/assets/2e59ffd1-b116-436f-bc44-2a09b22a96bb)
- Ao abrir o remix e clicar na extensão, clique em adicionar conta 2:
![image](https://github.com/user-attachments/assets/cd670756-3712-4339-8acd-9ff494e3511c)
- Agora é possível usar a conta da rede para realizar transações


