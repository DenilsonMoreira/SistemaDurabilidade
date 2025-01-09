#!/bin/bash

docker build -t mm .
if [ $(docker ps | grep my | wc -l) -gt 0 ]; then
    echo "Deletando o container"
    docker rm my --force
    echo "Subindo o container"
else
    echo "N encontrado"
    echo "Subindo o container"
fi

docker run --rm -d -p 80:80 --volume=/home/leticia/Documentos/Denilson/Projetos/SistemaDurabilidade/app:/var/www/html --name my mm

echo "http://localhost"