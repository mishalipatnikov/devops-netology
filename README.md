1. Переменной "c" будет присвоено значение "a+b", так как bash считает такую запись текстом
   
   Переменной "d" будет присвоено значение "1+2", так как переменные обозначены, но bash складывает строки в этом случае
   
   Переменной "e" будет присвоено значение "3", так как с помощью скобок дана команда провести арифмитическую операцию со значениями переменных
2.
while ((1==1)) `#скобочки не было`

    do
    
        curl https://localhost:4757
        if (($? != 0))
        then
        date >> curl.log
        else
        brake     #нужно выйти из цикла, если последняя команда выполнена успешно
        fi
    done
3.
user@PC:~/netology$ cat check

    hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
    for i in {1..5}
    do
    date >> hosts.log
    for n in ${hosts[@]}
        do
         curl $n:80 >/dev/null
         echo $h status=$? >> hosts.log
        done
    done


4.
user@PC:~/netology$ cat check2

    hosts=(192.168.0.1 173.194.222.113 87.250.250.242)
    tmp=0
    while (($tmp==0))
    do
    date >> hosts_2.log
      for n in ${hosts[@]}
      do
         curl $n:80 >/dev/null
         tmp=$?
         if (($tmp!=0))
         then
            echo " ERROR " $h status=$temp >> hosts_2.log
         fi
      done
    done
