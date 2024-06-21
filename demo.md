<details>
  <summary>Модуль 1</summary>

Присвоение имён:
## HQ-R
```
hostnamectl set-hostname hq-r.hq.work;exec bash
```


## HQ-SRV
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

Перезагрузка адаптера:
```
service network restart
```


***

</details>
