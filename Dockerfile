FROM hyperledger/besu:latest

# Instala pacotes necessários para os nós
RUN apt-get update && apt-get install -y curl jq && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /opt/besu

# Copia apenas o script de inicialização (para network-setup)
COPY network-setup.sh /network-setup.sh
RUN chmod +x /network-setup.sh
