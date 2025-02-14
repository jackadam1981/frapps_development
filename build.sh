#!/bin/bash

docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

rm -rf devcontainer
rm -rf development
mkdir development
chmod 0777 development

cp -R ../frappe_docker/devcontainer-example/ devcontainer
cp create_site.sh development/

docker compose -f traefik.yaml up -d
docker compose -f devcontainer/docker-compose.yml up -d
docker exec -it devcontainer-frappe-1 bash

