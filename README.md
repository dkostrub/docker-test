# For development

## Instructions
### install make
sudo apt update
sudo apt install make

### container create
docker-compose build && docker-compose up -d

### container stop
docker-compose stop

### container stop and delete
docker-compose down - выполняется из корня проекта. Останавливает запущенный контейнер.

### container restart
docker-compose restart

### running container list
docker ps - список запущенных контейнеров

### active container list
docker network ls - список всех активных и неактивных сетей созданных docker'ом

### container delete
- docker system prune -a - очистка всех остановленных контейнеров и неиспользуемых сетей
- docker images purge -a
- docker volume prune -f
- docker stop $(docker ps -a -q)
- docker rm $(docker ps -a -q)
- docker volume rm $(docker volume ls -f dangling=true -q)
- docker rmi -f $(docker images -a -q)

### container views log
docker-compose logs nginx
ls -lah - для просмотра содержимого

### container view
docker-compose exec nginx bash

### PHP File installation location
project/

## images
- centOS7
- PHP7.2
- nginx
- mariaDB



    mysql -uroot -proot
    ALTER USER root IDENTIFIED WITH mysql_native_password BY 'root';
    exit // выходим из базы данных
    exit // выходим из контейнера mysql
