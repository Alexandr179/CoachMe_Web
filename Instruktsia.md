# Инструкция по развертыванию приложения Spring Boot без использования CI (v. 1.0)

## Работа с сервером

### 1. Заходим по ssh к серверу через логин и пароль, предоставленный VSCALE.

```
ssh root@0.0.0.0
```

### 2. Устанавливаем sudo

```
apt-get install sudo
```

### 3. Создаем нового пользователя developer для работы с приложением и папкой dev

```
useradd -m -d /home/developer developer
```

### 4. Задаем новому пользователю  пароль

```
passwd developer
```

### 5. Добавляем пользователя в группу sudo

```
usermod -a -G sudo developer
```

### 6. Открываем файл настроек ssh

```
nano /etc/ssh/sshd_config
```

### 7. Заменяем строки и нажимаем Ctrl + O, Enter, Ctrl + X

```
Port 22 -> Port 12
PermitRootLogin yes -> PermitRootLogin no
+ AllowUsers developer
```

### 8. Открываем bashrc-файл нового пользователя

```
cd /home/developer/
nano .bashrc
```

### 9. Добавляем строки и делаем замены

```
force_color_prompt=yes (убрать символ решетки)
```

### 10. Перезагружаем ssh

```
service ssh reload
```

### 11. Выходим из сессии и заходим снова, уже через другой порт и другого пользователя

```
ssh developer@185.143.173.124 -p 12
```

### 12. Выполняем команду для нормальной работы с shell

```
sudo chsh -s /bin/bash developer
```

### 13. Выходим из сесси и заходим заново, теперь командная строка будет выглядеть по-другому

```
developer@cs211930:~$
```

### 14. Устанавливаем git

```
sudo apt-get update
sudo apt-get install git
```

### 15. Удаляем openjdk

```
sudo apt-get remove java*
```

### 16. Устанавливаем oracle jdk

```
sudo apt-get install python-software-properties
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
```

### 17. Устанавливаем postgres

```
sudo apt-get install postgresql postgresql-contrib
```

### 18. Переходим в роль postgres и запускаем psql

```
sudo -u postgres psql
```

### 19. Задаем пароль для пользователя postgres

```
\password postgres
```

### 20. Сменим порт работы postgres

```
cd /etc/postgresql/9.5/main/
sudo nano postgresql.conf

port = 5432 -> port = 5433
listen_addresses = 'localhost' -> listen_addresses = '*'

sudo service postgresql restart
```

### 21. Разрешим удаленные подключения

```
cd /etc/postgresql/9.5/main/
sudo nano pg_hba.conf
```

### 22. Добавить строки

```
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5
```

### 23. Перезапустим postgres

```
sudo service postgresql restart  
```

### 24. Установим необходимую локаль:

```
sudo locale-gen ru_RU
sudo locale-gen ru_RU.UTF-8
sudo update-locale 
```

### 25. Снова запустим psql

```
sudo -u postgres psql
```

### 26. Создадим БД

```
CREATE DATABASE robooky_db
  WITH OWNER "postgres"
  ENCODING 'UTF8'
  LC_COLLATE = 'ru_RU.UTF-8'
  LC_CTYPE = 'ru_RU.UTF-8'
  TEMPLATE = template0
```

### 27. Установка Tomcat - создаем группу для tomcat

```
sudo groupadd tomcat
```

### 28. Создадим пользователя с доверенной папкой

```
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat-developer
```

### 29. Скачаем tomcat

```
curl -O http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-9/v9.0.12/bin/apache-tomcat-9.0.12.tar.gz
```

### 30. Создадим папку для tomcat

```
sudo mkdir /opt/tomcat
```

### 31. Распакуем архив с tomcat

```
sudo tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
```

### 32. Настройки прав

```
​sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat-developer webapps/ work/ temp/ logs/
```

### 33. Создадим сервис для tomcat

```
sudo nano /etc/systemd/system/tomcat.service
```

### 34. Заполним его следующим содержимым

```
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
```

### 35. Перезагрузим systemctl

```
sudo systemctl daemon-reload
```

### 36. Прописать в /opt/tomcat/conf/server.xml 

```
<Connector port="80" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />
```

### 37. Прописать в /opt/tomcat/conf/tomcat-users.xml

```
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">
<role rolename="manager"/>
<role rolename="manager-gui"/>
<user username="tomcat-developer" password="****" roles="manager,manager-gui,admin-gui,manager-gui,manager-script,manager-jmx,manager-status,admin-script"/>
</tomcat-users>
```

### 38. Установить authbind

```
sudo apt-get install authbind
```

### 39. Сделать порт доступным:

```
sudo touch /etc/authbind/byport/80
sudo chmod 500 /etc/authbind/byport/80
sudo chown glassfish /etc/authbind/byport/80
```

### 40. Создать файл в /opt/tomcat/bin

```
sudo touch setenv.sh
```

### 41. Прописать в файле:

```
CATALINA_OPTS="-Djava.net.preferIPv4Stack=true"
JAVA_OPTS="$JAVA_OPTS -Dspring.profiles.active=<active profile>"
```

### 42. Переписать statup.sh в последней строке

```
exec authbind --deep "$PRGDIR"/"$EXECUTABLE" start "$@"
```

### 43. В /opt/tomcat/webapps/manager/META-INF/context.xml закомментировать:

```
<Context antiResourceLocking="false" privileged="true" >
  <Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />
  <Manager sessionAttributeValueClassNameFilter="java\.lang\.(?:Boolean|Integer|Long|Number|String)|org\.apache\.$
</Context>
```