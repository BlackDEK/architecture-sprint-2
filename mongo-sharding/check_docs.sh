#!/usr/bin/env bash

docker exec -it shard1 bash -c "echo '$(cat "./scripts/check_docs.js")' | mongosh --port 27018"
docker exec -it shard2 bash -c "echo '$(cat "./scripts/check_docs.js")' | mongosh --port 27019"
docker exec -it mongosRouter bash -c "echo '$(cat "./scripts/check_docs.js")' | mongosh --port 27020"