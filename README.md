# devops-netology
1. commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Update CHANGELOG.md
С помощью команды "git show aefea" можно посмотреть полную информацию о коммите по его хэшу.
2.  v0.12.23
Так же с помощью команды "git show" я посмотрел коммит 85024d3, в полной информации которого было указано какому тегу он соответсвует.
3. 56cd7859e05c36c06b56d013b55a252d0bb7e158
   9ea88f22fc6269854151c571162c5bcf958bee2b
4. 33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release

git log --oneline --graph <v0.12.23>..<v0.12.24>
Позволяет вывести все хеши и комментарии коммитов, которые были сделаны между указаными тегами.
5.commit 5e06e39fcc86bb622b962c87da84213d3331ddf8

"git log -S providerSource" выводит все коммиты, когда функция providerSource была изменена, самое первое упоминание от 28 Ноября 2018 года

6. 35a058fb3 main: configure credentials from the CLI config file
c0b176109 prevent log output during init
8364383c3 Push plugin discovery down into command package

"git log -s globalPluginDirs" так же отображает все коммиты, когда была изменена данная функция
7. Martin Atkins
"git log -S synchronizedWriters --oneline --pretty=%an" позволяет вывести только имя автора без лишней информации.
