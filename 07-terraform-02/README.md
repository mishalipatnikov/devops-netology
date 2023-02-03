### Задача 1
В Yandex Cloud можно создавать образы с помощью Packer

### Задача 2
```
[admin@fedora cloud-terraform]$ terraform destroy
yandex_vpc_network.network-1: Refreshing state... [id=enpe3rr826dg06otapu0]
yandex_vpc_subnet.subnet-1: Refreshing state... [id=e9b30vhrmonba0depvhk]
yandex_compute_instance.vm-1: Refreshing state... [id=fhmg3c6sde2enqp81rmm]
yandex_compute_instance.vm-2: Refreshing state... [id=fhmc2shnic1pq240ls3j]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
following symbols:
  - destroy

Terraform will perform the following actions:

  # yandex_compute_instance.vm-1 will be destroyed
  - resource "yandex_compute_instance" "vm-1" {
      - created_at                = "2023-02-03T10:57:00Z" -> null
      - folder_id                 = "b1g48dgrh161ja51mt61" -> null
      - fqdn                      = "fhmg3c6sde2enqp81rmm.auto.internal" -> null
      - id                        = "fhmg3c6sde2enqp81rmm" -> null
      - labels                    = {} -> null
      - metadata                  = {
          - "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKenNC6ozKzDzFTiKJGrbi3dC3cmmg64DlVYZ7Bi5h4/ admin@fedora
            EOT
        } -> null
      - name                      = "terraform1" -> null
      - network_acceleration_type = "standard" -> null
      - platform_id               = "standard-v1" -> null
      - status                    = "running" -> null
      - zone                      = "ru-central1-a" -> null

      - boot_disk {
          - auto_delete = true -> null
          - device_name = "fhm9nodakjbn5ucp3mr6" -> null
          - disk_id     = "fhm9nodakjbn5ucp3mr6" -> null
          - mode        = "READ_WRITE" -> null

          - initialize_params {
              - block_size = 4096 -> null
              - image_id   = "fd8hpqvd8id5l4gb74t2" -> null
              - size       = 3 -> null
              - type       = "network-hdd" -> null
            }
        }

      - metadata_options {
          - aws_v1_http_endpoint = 1 -> null
          - aws_v1_http_token    = 1 -> null
          - gce_http_endpoint    = 1 -> null
          - gce_http_token       = 1 -> null
        }

      - network_interface {
          - index              = 0 -> null
          - ip_address         = "192.168.10.13" -> null
          - ipv4               = true -> null
          - ipv6               = false -> null
          - mac_address        = "d0:0d:10:1b:0d:c6" -> null
          - nat                = true -> null
          - nat_ip_address     = "158.160.55.106" -> null
          - nat_ip_version     = "IPV4" -> null
          - security_group_ids = [] -> null
          - subnet_id          = "e9b30vhrmonba0depvhk" -> null
        }

      - placement_policy {
          - host_affinity_rules = [] -> null
        }

      - resources {
          - core_fraction = 100 -> null
          - cores         = 2 -> null
          - gpus          = 0 -> null
          - memory        = 2 -> null
        }

      - scheduling_policy {
          - preemptible = false -> null
        }
    }

  # yandex_compute_instance.vm-2 will be destroyed
  - resource "yandex_compute_instance" "vm-2" {
      - created_at                = "2023-02-03T10:58:16Z" -> null
      - folder_id                 = "b1g48dgrh161ja51mt61" -> null
      - fqdn                      = "fhmc2shnic1pq240ls3j.auto.internal" -> null
      - id                        = "fhmc2shnic1pq240ls3j" -> null
      - labels                    = {} -> null
      - metadata                  = {
          - "ssh-keys" = <<-EOT
                ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKenNC6ozKzDzFTiKJGrbi3dC3cmmg64DlVYZ7Bi5h4/ admin@fedora
            EOT
        } -> null
      - name                      = "terraform2" -> null
      - network_acceleration_type = "standard" -> null
      - platform_id               = "standard-v1" -> null
      - status                    = "running" -> null
      - zone                      = "ru-central1-a" -> null

      - boot_disk {
          - auto_delete = true -> null
          - device_name = "fhms374n93jcqu6pbi67" -> null
          - disk_id     = "fhms374n93jcqu6pbi67" -> null
          - mode        = "READ_WRITE" -> null

          - initialize_params {
              - block_size = 4096 -> null
              - image_id   = "fd8hpqvd8id5l4gb74t2" -> null
              - size       = 3 -> null
              - type       = "network-hdd" -> null
            }
        }

      - metadata_options {
          - aws_v1_http_endpoint = 1 -> null
          - aws_v1_http_token    = 1 -> null
          - gce_http_endpoint    = 1 -> null
          - gce_http_token       = 1 -> null
        }

      - network_interface {
          - index              = 0 -> null
          - ip_address         = "192.168.10.19" -> null
          - ipv4               = true -> null
          - ipv6               = false -> null
          - mac_address        = "d0:0d:c1:72:37:93" -> null
          - nat                = true -> null
          - nat_ip_address     = "158.160.51.237" -> null
          - nat_ip_version     = "IPV4" -> null
          - security_group_ids = [] -> null
          - subnet_id          = "e9b30vhrmonba0depvhk" -> null
        }

      - placement_policy {
          - host_affinity_rules = [] -> null
        }

      - resources {
          - core_fraction = 100 -> null
          - cores         = 4 -> null
          - gpus          = 0 -> null
          - memory        = 4 -> null
        }

      - scheduling_policy {
          - preemptible = false -> null
        }
    }

  # yandex_vpc_network.network-1 will be destroyed
  - resource "yandex_vpc_network" "network-1" {
      - created_at = "2023-02-03T10:55:39Z" -> null
      - folder_id  = "b1g48dgrh161ja51mt61" -> null
      - id         = "enpe3rr826dg06otapu0" -> null
      - labels     = {} -> null
      - name       = "network1" -> null
      - subnet_ids = [
          - "e9b30vhrmonba0depvhk",
        ] -> null
    }

  # yandex_vpc_subnet.subnet-1 will be destroyed
  - resource "yandex_vpc_subnet" "subnet-1" {
      - created_at     = "2023-02-03T10:55:40Z" -> null
      - folder_id      = "b1g48dgrh161ja51mt61" -> null
      - id             = "e9b30vhrmonba0depvhk" -> null
      - labels         = {} -> null
      - name           = "subnet1" -> null
      - network_id     = "enpe3rr826dg06otapu0" -> null
      - v4_cidr_blocks = [
          - "192.168.10.0/24",
        ] -> null
      - v6_cidr_blocks = [] -> null
      - zone           = "ru-central1-a" -> null
    }

Plan: 0 to add, 0 to change, 4 to destroy.

Changes to Outputs:
  - external_ip_address_vm_1 = "158.160.55.106" -> null
  - external_ip_address_vm_2 = "158.160.51.237" -> null
  - internal_ip_address_vm_1 = "192.168.10.13" -> null
  - internal_ip_address_vm_2 = "192.168.10.19" -> null

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

yandex_compute_instance.vm-2: Destroying... [id=fhmc2shnic1pq240ls3j]
yandex_compute_instance.vm-1: Destroying... [id=fhmg3c6sde2enqp81rmm]
yandex_compute_instance.vm-2: Still destroying... [id=fhmc2shnic1pq240ls3j, 10s elapsed]
yandex_compute_instance.vm-1: Still destroying... [id=fhmg3c6sde2enqp81rmm, 10s elapsed]
yandex_compute_instance.vm-1: Destruction complete after 16s
yandex_compute_instance.vm-2: Still destroying... [id=fhmc2shnic1pq240ls3j, 20s elapsed]
yandex_compute_instance.vm-2: Destruction complete after 26s
yandex_vpc_subnet.subnet-1: Destroying... [id=e9b30vhrmonba0depvhk]
yandex_vpc_subnet.subnet-1: Destruction complete after 2s
yandex_vpc_network.network-1: Destroying... [id=enpe3rr826dg06otapu0]
yandex_vpc_network.network-1: Destruction complete after 0s

Destroy complete! Resources: 4 destroyed.
```