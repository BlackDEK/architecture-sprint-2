#!/usr/bin/env bash
docker compose up -d 

echo "Даем инициализироваться контейнерам."
sleep 3
docker exec -it shard1 bash -c "echo '$(cat "./scripts/init_shard1.js")' | mongosh --port 27018"
docker exec -it shard2 bash -c "echo '$(cat "./scripts/init_shard2.js")' | mongosh --port 27019"
docker exec -it configSrv bash -c "echo '$(cat "./scripts/init_configsvr.js")' | mongosh --port 27017"

echo "Даем mongosRouter время на осознание, что configSrv инициализирован."
sleep 6
docker exec -it mongosRouter bash -c "echo '$(cat "./scripts/init_router.js")' | mongosh --port 27020"

