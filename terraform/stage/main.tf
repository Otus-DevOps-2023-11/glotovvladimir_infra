#terraform {
#  required_providers {
#    yandex = {
#      source  = "yandex-cloud/yandex"
#      version = "0.104"
#    }
#  }
#  required_version = ">=0.13"
#}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image = var.app_disk_image
  subnet_id = var.subnet_id
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  private_key_path = var.private_key_path
  service_account_key_file = var.service_account_key_file
}

module "db" {
  source = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image = var.db_disk_image
  subnet_id = var.subnet_id
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  private_key_path = var.private_key_path
  service_account_key_file = var.service_account_key_file
}

