docker build -t mm .
docker rm my --force
docker run --rm -d -p 80:80 --volume=C:\Users\letic\OneDrive\Documentos\Denilson\Projetos\SistemaDurabilidade\app:/var/www/html --name my mm 
