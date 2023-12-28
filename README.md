# glotovvladimir_infra
glotovvladimir Infra repository

Машина с публичным ip в ЯО:
158.160.61.217
Машина без публичного ip адреса в ЯО:
10.128.0.35

Для подключения к удаленной машине без публичного ip адреса через машину с публичным ip адресом в одну команду использован скрипт:
`sh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.61.217 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35`

Для создания alias использована следующая команда:
`alias ssh_someinternalhost='ssh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.61.217 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35'`
в результате чего подключиться к машине без публичного ip адреса можно по команде
`ssh_someinternalhost`