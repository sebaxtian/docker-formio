# docker-formio
Configuración de Docker para contener formio app

## Build Contenedor
docker build -t sebaxtian/docker-formio:1.0.0 .

## Run Contenedor
docker run --name docker-formio --env-file $PWD/.env -v $PWD/data/mongodata:/data/db -p 3002:3002 -d sebaxtian/docker-formio:1.0.0

## Restart Contenedor
docker restart docker-formio

## Ver logs de Contenedor
docker logs docker-formio

## Shell en Contenedor
docker exec -it docker-formio bash

## Eliminar Contenedor
docker rm docker-formio

## Eliminar Image de Contenedor
docker image rm sebaxtian/docker-formio:1.0.0
