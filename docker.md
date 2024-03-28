** Обновление пакетов
apt-get update && apt-get upgrade

** Установка DOCKER
apt-get install docker-engine
apt-get install docker-compose
systemctl start docker

** Создание пользователя
adduser altlunxu
passwd altlunxu (Если при создании пользователя не паоставится пароль)

** Создание файла и дериктории
touch name.txt
echo experts > name.txt
cat name.txt
mkdir hello
mv name.txt hello/

** Создание Dockerfile
nano hello/Dockerfile

** Билд и запуск docker
docker build -t firpo -f Dockerfile .
docker run firpo
