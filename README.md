Задача 1.</br>
<<<<<<< HEAD
https://hub.docker.com/repository/docker/mishalipatnikov/server-nginx </br>
Задача 2. </br>
Высоконагруженное монолитное java веб-приложение;</br>
Думаю лучше подойдет физическая машина для лучшего использования ресурсов</br>

Nodejs веб-приложение;</br>
Веб-приложение как раз хорошо подходят для работы в контейнере, можно будет легко масштабировать или обновлять</br>

Мобильное приложение c версиями для Android и iOS;</br>
Виртуальная машина для работы с графическим интерфейсом</br>

Шина данных на базе Apache Kafka;</br>
В зависимости от типа данных, если критично, то лучше виртуалку, елси нет, то в контейнере.

Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;</br>
Elasticsearch в виртуальной машине для улучшения отказоустойчивости, остальное либо в контейнер, либо в виртуалку.

Мониторинг-стек на базе Prometheus и Grafana;</br>
Будет удобно работать в контейнере, они не так много требуют ресурсов</br>

MongoDB, как основное хранилище данных для java-приложения;</br>
Можно запустить на виртуальной машине, так как нет высоких системных требований. БД нельзя хранить в самом контейнере</br>

Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.</br>
Тоже можно запускать в контейнере

Задача 3. </br>

Первый контейнер с Centos

    user@ubuntu:/data$ sudo docker run -v /data:/data -t -d --name  centos-server centos
    e39a303967ca6df6cb8f24cb155ab3ab8e5ef3be433b630d75584fac75c6057b
    user@ubuntu:/data$ sudo docker exec -it centos-server /bin/bash
    [root@e39a303967ca /]# cd /data/
    [root@e39a303967ca data]# touch file_1
    [root@e39a303967ca data]# echo centos_1>file_1
    [root@e39a303967ca data]# cat file_1
    centos_1
    [root@e39a303967ca data]# exit
    exit

Хостовая машина

    user@ubuntu:/data$ cd /data/
    user@ubuntu:/data$ ls
    file_1
    user@ubuntu:/data$ cat file_1
    centos_1
    user@ubuntu:/data$ nano host_file
    user@ubuntu:/data$ ls
    file_1  host_file

Второй контейнер с Centos


    user@ubuntu:/data$ sudo docker run -v /data:/data -t -d --name centos-second centos
    bbd5d7e2c2e84ba5bbe2212e0c229d864770f7297dac0b73f3f5c198ab18fa37
    user@ubuntu:/data$ sudo exec -it centos-second /bin/bash
    sudo: exec: command not found
    user@ubuntu:/data$ sudo docker exec -it centos-second /bin/bash
    [root@bbd5d7e2c2e8 /]# cd /data
    [root@bbd5d7e2c2e8 data]# ls
    file_1  host_file
    [root@bbd5d7e2c2e8 data]# cat host_file
    host_machine
    [root@bbd5d7e2c2e8 data]# cat file_1
    centos_1
    centos_1