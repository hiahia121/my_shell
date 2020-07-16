#!/bin/bash

docker ps -a | grep cinder > has_docker
logs=`cat has_docker | sed 's/.*/cinder/g' | sed 's/_/cinder_/g'`

for item in $logs
do
    echo 'begin kill '$item
    docker stop $item
    echo 'end kill '$item
    docker stop $item
  done