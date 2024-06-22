<details>
  <summary>Модуль 1</summary>

Присвоение имён:
```
hostnamectl set-hostname hq-r.hq.work;exec bash
```

Смотрим название адаптера:
```
ip a
```
Настройка ip-адреса:  
```
touch /etc/net/ifaces/ens18/ipv4address
echo 192.168.0.2/25 > /etc/net/ifaces/ens18/ipv4address
```
Настройка шлюза по умолчанию: 
```
touch /etc/net/ifaces/ens18/ipv4route
echo default via 192.168.0.1 > /etc/net/ifaces/ens18/ipv4route
```
Параметры интерфейса:
```
vim /etc/net/ifaces/ens18/options
```
```
BOOTPROTO=static
TYPE=eth
NM_CONTROLLED=no
DISABLED=no
CONFIG_IPV4=yes
CONFIG_IPV6=yes
```
DNS-сервер:
```
echo nameserver 8.8.8.8 > /etc/resolv.conf



```
Iperf замер HQ-R:
```
iperf3 -c 192.168.0.161 -f M
```
Перезагрузка адаптера:
```
service network restart
```
```
version: '3'
services:
  mediawiki:
    image: mediawiki
    restart: always
    ports:
      - 8080:80
    links:
      - database
    container_name: wiki
    volumes:
      - images:/var/www/html/images
# Сначала устанавливаем вручную до конца, потом убираем комментарий
#      - ./LocalSettings.php:/var/www/html/LocalSettings.php
  database:
    image: mariadb
    container_name: mariadb
    restart: always
    environment:
      MYSQL_DATABASE: mediawiki
      MYSQL_USER: wiki
      MYSQL_PASSWORD: DEP@ssw0rd
      MYSQL_RANDOM_ROOT_PASSWORD: 'yes'
      TZ: Asia/Yekaterinburg
    volumes:
      - db:/var/lib/mysql
volumes:
  images:
  db:
```

***

</details>
