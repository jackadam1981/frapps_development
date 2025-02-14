#!/bin/bash

docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

rm -rf 
rm -rf 
rm -rf 
rm -rf 


cp -R ../frappe_docker/devcontainer-example/ devcontainer

wget https://gist.githubusercontent.com/guinanlin/eb8cd7534efad3234ffcdcf34b71004e/raw/cn_saas_chart_of_accounts.json -O /apps/erpnext/erpnext/accounts/doctype/account/chart_of_accounts/verified

docker compose -f traefik.yaml up -d
docker compose -f ../.devcontainer/docker-compose.yml up -d
docker exec -it devcontainer-frappe-1 bash create_site.sh

