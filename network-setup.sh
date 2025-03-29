#!/bin/sh
set -e  # Faz o script parar em caso de erro

echo "Iniciando serviço"
sleep 5

# Função para obter o IP do contêiner dentro da rede Docker
get_container_ip() {
    local container_name=$1
    echo $(getent hosts $container_name | awk '{ print $1 }')
}

# Função para capturar o enode de um nó e substituir o IP pelo IP correto do contêiner
get_enode() {
    local node_name=$1
    local node_port=$2
    local node_ip=$(get_container_ip $node_name)

    local enode=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' \
        -H "Content-Type: application/json" http://$node_name:$node_port | jq -r '.result')

    # Substituir 127.0.0.1 ou nomes de contêiner pelo IP real do contêiner
    echo $enode | sed -E "s/@(127.0.0.1|$node_name)/@$node_ip/g"
}

# Capturando enodes e corrigindo IPs
NODE1=$(get_enode "besu-node1" 8545)
NODE2=$(get_enode "besu-node2" 8546)
NODE3=$(get_enode "besu-node3" 8547)
NODE4=$(get_enode "besu-node4" 8548)

sleep 5

# Criando allowlist para todos os nós
ALLOWLIST_JSON=$(jq -n --arg n1 "$NODE1" --arg n2 "$NODE2" --arg n3 "$NODE3" --arg n4 "$NODE4" \
  '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[[$n1, $n2, $n3, $n4]], "id":1}')

echo "Allowlist JSON: $ALLOWLIST_JSON"
echo "Aplicando permissão nos nós..."

for node in besu-node1:8545 besu-node2:8546 besu-node3:8547 besu-node4:8548; do
    curl -s -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://$node
    sleep 2
done

sleep 10  # Pequeno delay para permitir a configuração

echo "Conectando os nós..."
for target_node in besu-node2:8546 besu-node3:8547 besu-node4:8548; do
    echo "Adicionando $NODE1 a $target_node"
    curl -s -X POST --data "{\"jsonrpc\":\"2.0\",\"method\":\"admin_addPeer\",\"params\":[\"$NODE1\"],\"id\":1}" \
        -H "Content-Type: application/json" http://$target_node
    sleep 2
done

echo "Confirmando conexões P2P"
curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' \
    -H "Content-Type: application/json" http://besu-node1:8545 | jq '.'

sleep 5
echo "Setup finalizado!"
