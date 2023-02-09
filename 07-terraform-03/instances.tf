
module "instance" {
  for_each = local.vms[terraform.workspace]
  source = "../modules/instance"
  instance_count = each.value

  zone = var.YC_REGION
  folder_id = var.YC_FOLDER_ID
  image         = "centos-7"
  platform_id   = "standard-v2"
  name          = each.key
  description   = "News App Demo"
  instance_role = "news,balancer"
  users         = "centos"
  cores         = local.news_cores[terraform.workspace]
  boot_disk     = "network-ssd"
  disk_size     = local.news_disk_size[terraform.workspace]
  nat           = "true"
  memory        = "2"
  core_fraction = "100"
}

output "public_ip" {
  value = {
    for k, v in module.instance : k => v.instance_public_ip
  }
}