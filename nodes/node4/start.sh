#!/bin/bash
sleep 10
# Capturar os enodes dos 4 nós
NODE1=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8545 | jq -r '.result')
NODE2=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8546 | jq -r '.result')
NODE3=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8547 | jq -r '.result')
NODE4=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"net_enode","params":[],"id":1}' -H "Content-Type: application/json" http://127.0.0.1:8548 | jq -r '.result')

# Criar o JSON para adicionar os nós à allowlist
ALLOWLIST_JSON=$(jq -n --arg n1 "$NODE1" --arg n2 "$NODE2" --arg n3 "$NODE3" --arg n4 "$NODE4" \
  '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[[$n1, $n2, $n3, $n4]], "id":1}')

# Enviar a requisição para adicionar os nós à allowlist
curl -X POST --data "$ALLOWLIST_JSON" -H "Content-Type: application/json" http://127.0.0.1:8548/
