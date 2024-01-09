# glotovvladimir_infra
glotovvladimir Infra repository

bastion_IP = 158.160.114.107
someinternalhost_IP = 10.128.0.35

Для подключения к удаленной машине без публичного ip адреса через машину с публичным ip адресом в одну команду использован скрипт:
`ssh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.114.107 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35`

Для создания alias использована следующая команда:
`alias ssh_someinternalhost='ssh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.114.107 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35'`
в результате чего подключиться к машине без публичного ip адреса можно по команде
`ssh_someinternalhost`

Для подключения с использованием vpn поднят pritunl сервер на bastion машине, проверялось через подключение с виртуальной Ubuntu 20.04