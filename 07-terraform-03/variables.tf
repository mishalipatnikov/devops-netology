variable "vnet_name" {
  type    = string
  default = "example_vnet"
}

variable "YC_CLOUD_ID" {
  default = "b1gkd6jtmac58a4pdvit"
}
variable "YC_FOLDER_ID" {
  default = "b1g48dgrh161ja51mt61"
}
variable "YC_REGION" {
  default = "ru-central1-a"
}


locals {
  vms = {
    stage = {
      news: 1,
      redis: 1,
    },
    prod = {
      news: 2,
      redis: 3,
      balancer: 1,
    }

  }
  news_cores = {
    default = 2
    stage = 2
    prod = 2
  }
  news_disk_size = {
    default = 20
    stage = 20
    prod = 40
  }
  news_instance_count = {
    default = 1
    stage = 1
    prod = 2
  }
  vpc_subnets = {
    default = [
      {
        "v4_cidr_blocks": [
          "192.168.10.0/24"
        ],
        "zone": var.YC_REGION
      }
    ]
    stage = [
      {
        "v4_cidr_blocks": [
          "192.168.11.0/24"
        ],
        "zone": var.YC_REGION
      }
    ]
    prod = [
      {
        zone           = var.YC_REGION
        v4_cidr_blocks = ["192.168.12.0/24"]
      },
      {
        zone           = var.YC_REGION
        v4_cidr_blocks = ["192.168.13.0/24"]
      },
      {
        zone           = var.YC_REGION
        v4_cidr_blocks = ["192.168.14.0/24"]
      }
    ]
  }
}
