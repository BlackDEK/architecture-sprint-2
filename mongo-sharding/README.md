# Шардирование

## Алгоритм запуска

- Сделать файл `start.sh` исполняемым.
- Запустить файл `./start.sh`.
- Чтобы остановить `docker compose down -v`.

Если start.sh работает некорректно(Время для sleep выделено слишком мало), то можно выполнить следующие действия, чтобы инициализировать в ручную:

```bash
cd <path to sprint>/mongo-sharding
docker exec -it shard1 bash -c "echo '$(cat "./scripts/init_shard1.js")' | mongosh --port 27018"

docker exec -it shard2 bash -c "echo '$(cat "./scripts/init_shard2.js")' | mongosh --port 27019"

docker exec -it configSrv bash -c "echo '$(cat "./scripts/init_configsvr.js")' | mongosh --port 27017"

docker exec -it mongosRouter bash -c "echo '$(cat "./scripts/init_router.js")' | mongosh --port 27020"


```

## Алгоритм проверки

- Запустить файл `./start.sh`.
- Сделать файл `check_docs.sh` исполняемым.
- Запустить файл `./check_docs.sh`.
