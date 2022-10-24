#!bin/sh

set -eu

CONTAINERNAME="front-app"

if docker compose ps ${CONTAINERNAME} | grep -q running; then
  cmd="docker compose down"
else
  cmd="docker compose -f docker-compose.dev.yml up -d"
fi

echo $cmd
$cmd
