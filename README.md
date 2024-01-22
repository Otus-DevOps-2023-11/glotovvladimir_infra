# glotovvladimir_infra
glotovvladimir Infra repository

### ДЗ 3: Знакомство с облачной инфраструктурой и облачными сервисами:

bastion_IP = 158.160.114.107
someinternalhost_IP = 10.128.0.35

Для подключения к удаленной машине без публичного ip адреса через машину с публичным ip адресом в одну команду использован скрипт:
`ssh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.114.107 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35`

Для создания alias использована следующая команда:
`alias ssh_someinternalhost='ssh -i /home/adminuser/.ssh/yandexkey -t appuser@158.160.114.107 ssh -i /home/appuser/.ssh/yandexkey appuser@10.128.0.35'`
в результате чего подключиться к машине без публичного ip адреса можно по команде
`ssh_someinternalhost`

Для подключения с использованием vpn поднят pritunl сервер на bastion машине, проверялось через подключение с виртуальной Ubuntu 20.04

Для подключения с использованием vpn поднят pritunl сервер на bastion машине, проверялось через подключение с виртуальной Ubuntu 20.04

### ДЗ 4: Основные сервисы Yandex Cloud:

testapp_IP = 158.160.136.11
testapp_port = 9292

Скрипт для создания ВМ через YC CLI:
`yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-d,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=user_data.yaml`

### ДЗ 5: Модели управления инфраструктурой. Подготовка образов с помощью Packer:

Создан скрипт для создания образа ВМ с установленными ruby и mongodb

Запускается скриптом:
`packer build -var-file variables.json ubuntu16.json`

Проверено по логам, что пакеты устанавливаются, после проверена работоспособность приложения после стягивания кода и его запуска

### ДЗ 6: Знакомство с Terraform:

Созданы необходимые для деплоя образа ВМ .tf файлы, проверена работоспособность конфишурации через успешный запуск `terraform apply`
