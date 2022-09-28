start "block" /d "pro_ver0.8\block_server" block
start "restfulapi" /d "pro_ver0.8\restfulapi" restfulapi
start "interface" /d "pro_ver0.8\interface" interface
start "rpcserver" /d "pro_ver0.8\rpc_server" /min rpcserver
start "txserver" /d "pro_ver0.8\tx_server" txserver
start "node1" /d "pbft_core\test\5000" consensusPBFT P1
start "node2" /d "pbft_core\test\5001" consensusPBFT P2
start "node3" /d "pbft_core\test\4000" consensusPBFT P3
start "node4" /d "pbft_core\test\4001" consensusPBFT P4