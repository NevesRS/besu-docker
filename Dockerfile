FROM hyperledger/besu:latest

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y jq
WORKDIR /opt/besu

COPY config /config
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# COPY start.sh /start.sh
# RUN chmod +x /start.sh
