#!/bin/bash
container_name="$1"
if [[ "$(docker ps | grep $container_name 2> /dev/null)" != "" ]]; then
  echo "exists and running"
  docker stop $container_name
  docker rm $container_name
elif [[ "$(docker ps -a | grep $container_name 2> /dev/null)" != "" ]]; then
  echo "exists but stopped"
  docker rm $container_name
else
  echo "$container_name doesn't exist"
fi