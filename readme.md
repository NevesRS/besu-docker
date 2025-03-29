cd Node-1
Iniciar o nodo 1:
besu --data-path=data --genesis-file=../../genesis.json --permissions-nodes-config-file-enabled --permissions-accounts-config-file-enabled --rpc-http-enabled --rpc-http-api=ADMIN,ETH,NET,PERM,IBFT --host-allowlist="*" --rpc-http-cors-origins="*" --profile=ENTERPRISE
Resultado Enode 1
enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303

cd Node-2
Iniciar o nodo 2:
besu --data-path=data --genesis-file=../../genesis.json --permissions-nodes-config-file-enabled --permissions-accounts-config-file-enabled --rpc-http-enabled --rpc-http-api=ADMIN,ETH,NET,PERM,IBFT --host-allowlist="*" --rpc-http-cors-origins="*" --p2p-port=30304 --rpc-http-port=8546 --profile=ENTERPRISE
Resultado  Enode 2:
enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304

cd Node-3
Iniciar o nodo 3:
besu --data-path=data --genesis-file=../../genesis.json --permissions-nodes-config-file-enabled --permissions-accounts-config-file-enabled --rpc-http-enabled --rpc-http-api=ADMIN,ETH,NET,PERM,IBFT --host-allowlist="*" --rpc-http-cors-origins="*" --p2p-port=30305 --rpc-http-port=8547 --profile=ENTERPRISE
Resultado  Enode 3:
enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305

cd besu/Node-4
besu --data-path=data --genesis-file=../../genesis.json --permissions-nodes-config-file-enabled --permissions-accounts-config-file-enabled --rpc-http-enabled --rpc-http-api=ADMIN,ETH,NET,PERM,IBFT --host-allowlist="*" --rpc-http-cors-origins="*" --p2p-port=30306 --rpc-http-port=8548 --profile=ENTERPRISE
Resultado Enode 4:
enode://e91533b93cea26c77329d40be33789513266e8697739ae69f3bfe0f9be3eb78ea8353da1a4d7aa10a870e354bf5db08d8b2aa0f8d0a7f90ac4e4fb7741548371@127.0.0.1:30306

Configuração da rede:

Add permissions Node-1:
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303","enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304","enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305","enode://e91533b93cea26c77329d40be33789513266e8697739ae69f3bfe0f9be3eb78ea8353da1a4d7aa10a870e354bf5db08d8b2aa0f8d0a7f90ac4e4fb7741548371@127.0.0.1:30306"]], "id":1}' http://127.0.0.1:8545/ -H "Content-Type: application/json"

Add permissions Node-2:
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303","enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304","enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305","enode://e91533b93cea26c77329d40be33789513266e8697739ae69f3bfe0f9be3eb78ea8353da1a4d7aa10a870e354bf5db08d8b2aa0f8d0a7f90ac4e4fb7741548371@127.0.0.1:30306"]], "id":1}' http://127.0.0.1:8546/ -H "Content-Type: application/json"

Add permissions Node-3:
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303","enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304","enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305","enode://e91533b93cea26c77329d40be33789513266e8697739ae69f3bfe0f9be3eb78ea8353da1a4d7aa10a870e354bf5db08d8b2aa0f8d0a7f90ac4e4fb7741548371@127.0.0.1:30306"]], "id":1}' http://127.0.0.1:8547/ -H "Content-Type: application/json"

Add permissions Node-4:
curl -X POST --data '{"jsonrpc":"2.0","method":"perm_addNodesToAllowlist","params":[["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303","enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304","enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305","enode://e91533b93cea26c77329d40be33789513266e8697739ae69f3bfe0f9be3eb78ea8353da1a4d7aa10a870e354bf5db08d8b2aa0f8d0a7f90ac4e4fb7741548371@127.0.0.1:30306"]], "id":1}' http://127.0.0.1:8548/ -H "Content-Type: application/json"

Add node as peers:
Node-1 -> Node-2:
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303"],"id":1}' http://127.0.0.1:8546
Node-1 -> Node-3:
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303"],"id":1}' http://127.0.0.1:8547
Node-1 -> Node-4:
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://4378d4997facbc53de76faeb9e6eb9cc7e9a709dd6724eeed0a3e5ed28ba4d80928f08d84597d4d6ba63a9f418369cdc952e49cfee507df181d026ec15eab69d@127.0.0.1:30303"],"id":1}' http://127.0.0.1:8548
Node-2 -> Node-3:
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304"],"id":1}' http://127.0.0.1:8547
Node-2 -> Node-4
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://ca8a6efd0ad076595912c96c68815d16e9d04d403c5be4c27e322ec390ad41138104a030057cd7e0e702a09d8a502eec7a2e2e39fb22406354cb6914f66f7271@127.0.0.1:30304"],"id":1}' http://127.0.0.1:8548
Node-3 -> Node-4:
curl -X POST --data '{"jsonrpc":"2.0","method":"admin_addPeer","params":["enode://b83c428582b5d6e7b3780cb3236e984e893f8b2bf11b932c8581a4658c50e21e345180d5c11babbb46f1913a7c9237c35a73434c487693134a52bfff83798f7e@127.0.0.1:30305"],"id":1}' http://127.0.0.1:8548

Check peers:
curl -X POST --data '{"jsonrpc":"2.0","method":"net_peerCount","params":[],"id":1}' localhost:8545/ -H "Content-Type: application/json"
