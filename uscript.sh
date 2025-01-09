#!/bin/bash

docker build -t mm .
if [ $(docker ps | grep my | wc -l) -gt 0 ]; then
    docker rm my --force
else
    echo "N encontrado"
fi

docker run --rm -d -p 80:80 --volume=/home/leticia/Documentos/Denilson/Projetos/SistemaDurabilidade/app:/var/www/html --name my mm