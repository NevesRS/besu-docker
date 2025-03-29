#!/bin/sh
echo "Iniciando serviço"
sleep 5

echo "Capturando enodes..."
NODE1=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://besu-net:8545 | jq -r '.result')
NODE2=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://besu-net:8546 | jq -r '.result')
NODE3=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://besu-net:8547 | jq -r '.result')
NODE4=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://besu-net:8548 | jq -r '.result')

sleep 5

echo "Criando allowlist..."
ALLOWLIST_JSON=$(jq -n --arg n1 "$NODE1" --arg n2 "$NODE2" --arg n3 "$NODE3" --arg n4 "$NODE4" \
  '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[[$n1, $n2, $n3, $n4]], "id":1}')

echo "Allowlsit JSON: $ALLOWLIST_JSON"
echo "Aplicando permissão nos nós..."

sleep 5
curl -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://besu-net:8545
sleep 2
curl -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://besu-net:8546
sleep 2
curl -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://besu-net:8547
sleep 2
curl -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://besu-net:8548

sleep 10  # Pequeno delay para permitir a configuração

echo "Conectando os nós..."
echo "Configurando p2p para nodo 1, $NODE1"
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$$NODE1'"],"id":1}' http://besu-net:8546
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$$NODE1'"],"id":1}' http://besu-net:8547
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$$NODE1'"],"id":1}' http://besu-net:8548

sleep 5

echo "Configurando p2p para nodo 2, $NODE2"
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$NODE2'"],"id":1}' http://besu-net:8547
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$NODE2'"],"id":1}' http://besu-net:8548

sleep 5

echo "Configurando p2p para nodo 3, $NODE3"
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["'$NODE3'"],"id":1}' http://besu-net:8548

echo "Confirmando p2p"
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' node1:8545/ -H "Content-Type: application/json"
echo ""
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' node2:8546/ -H "Content-Type: application/json"
echo ""
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' node3:8547/ -H "Content-Type: application/json"
echo ""
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' node4:8548/ -H "Content-Type: application/json"


sleep 5
echo "Setup finalizado!"
