#!/bin/bash

 docker buildx build -t mm -f Dockerfile_app .
 docker buildx build -t mysql -f Dockerfile_bd .
if [ $(docker ps | grep my | wc -l) -gt 0 ]; then
    echo "Deletando o container"
    docker rm my --force
    echo "Subindo um novo container"
else
    echo "N encontrado"
    echo "Subindo o container"
fi

if [ $(docker ps | grep bd | wc -l) -gt 0 ]; then
    echo "Deletando o container"
    docker rm bd --force
    echo "Subindo um novo container"
else
    echo "N encontrado"
    echo "Subindo o container"
fi

docker run --rm -d -p 80:80 --network bridge --volume=/home/leticia/Documentos/Denilson/Projetos/SistemaDurabilidade/app:/var/www/html --name my mm 

echo "http://localhost"

docker run --rm -d -p 3306:3306 --network bridge -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=usuario -e MYSQL_PASSWORD=senha --volume=/mysql:/var/lib/mysql --name bd mysql