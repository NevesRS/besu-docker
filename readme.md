# Blockchain Besu Network

Este repositório configura uma rede blockchain utilizando o **Hyperledger Besu**. Os serviços são orquestrados via **Docker Compose** para facilitar a implantação e gerenciamento.

## Requisitos
Certifique-se de ter os seguintes softwares instalados:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Como rodar a rede Blockchain

1. Clone o repositório:
    ```sh
    git clone https://github.com/NevesRS/besu-docker.git
    cd besu-docker
    ```

2. Construa e inicie os contêineres:
    ```sh
    docker-compose up -d --build
    ```

### O que será criado:
- **Quatro nós Besu** conectados automaticamente em uma rede P2P
- **Um contêiner de configuração** para definir permissões e conexões
- **Uma rede Docker interna (`besu-net`)**
- **Endereços locais disponíveis:** `http://127.0.0.1:8545`, `http://127.0.0.1:8546`, `http://127.0.0.1:8547`, `http://127.0.0.1:8548`

## Verificação dos nós

Veja os contêineres em execução:
```sh
docker ps
```

Acompanhe os logs de um nó:
```sh
docker logs -f besu-node1
```

Verifique a quantidade de pares conectados:
```sh
curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8545
```

## Como desligar a rede

Para parar e remover os contêineres:
```sh
docker-compose down
```

## Deploy de contratos no Remix IDE

1. **Configure uma nova rede no Metamask:**
   - Abra o **Metamask** e clique em "Adicionar Rede".
   - Preencha os dados conforme a configuração da imagem abaixo:
   
   ![Configuração Metamask](https://github.com/user-attachments/assets/e9da8417-ba8f-4a38-9740-c05629eb4256)

2. **Adicione uma conta com chave privada:**
   - Acesse "Importar Conta" no Metamask.
   - Insira a chave privada abaixo:
   ```
   c87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3
   ```

3. **Conecte o Remix IDE ao Metamask:**
   - Abra o **Remix IDE** e clique na extensão do Metamask.
   - Selecione a conta adicionada e conecte-se à rede.

Agora você pode **implantar e interagir com contratos inteligentes** na sua rede Hyperledger Besu! 🚀

