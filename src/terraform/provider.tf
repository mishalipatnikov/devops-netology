# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "enpa29h8327t2pdss646"
  folder_id = "${var.yandex_folder_id}"
}
