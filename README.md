Задача 1.</br>
Быстрее развертывается инфраструктура, можно не запускать руками кучу файлов, легко масштабировать структуру, всегда всё происходит одинаково </br>
Основное свойство: результат всегда одинаковый</br>

Задача 2.</br>
Ansible не нужно разворачивать агент для связи, а все функции выполняются через существующую SSH структуру. Так же он разработан на Python, который встроен в большинство приложений.</br>
Нет какого-то однозначного решения, нужно использовать то, что подходит к каждому случаю отдельно. Но push модель немного надежнее на выкате.</br>

Задача 3.</br>
Ansible</br>

     user@E-01-0143:~$ ansible --version
     ansible [core 2.11.6]
     config file = /etc/ansible/ansible.cfg
     configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
     ansible python module location = /usr/lib/python3/dist-packages/ansible
     ansible collection location = /home/user/.ansible/collections:/usr/share/ansible/collections
     executable location = /usr/bin/ansible
     python version = 3.8.10 (default, Jun  2 2021, 10:49:15) [GCC 9.4.0]
     jinja version = 2.10.1
     libyaml = True

Vagrant

    C:\Users\mikhail.lipatnikov>vagrant --version
    Vagrant 2.2.19

VirtualBox

    user@E-01-0143:/usr/lib/virtualbox$ vboxmanage --version
    6.1.30r148432