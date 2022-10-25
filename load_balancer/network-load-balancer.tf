terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.81.0"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-bucket-evna"
    region     = "ru-central1-a"
    key        = "lemp.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true

  }
}

resource "yandex_lb_network_load_balancer" "lb-test" {
  name = "lb-test"

  listener {
    name = "listener-web-servers"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.web-servers.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "web-servers" {
  name = "web-servers-target-group"

  target {
    subnet_id = data.terraform_remote_state.vpc.outputs.vpc_subnet_id_vm_1
    address   = data.terraform_remote_state.vpc.outputs.internal_ip_address_vm_1
  }

  target {
    subnet_id = data.terraform_remote_state.vpc.outputs.vpc_subnet_id_vm_2
    address   = data.terraform_remote_state.vpc.outputs.internal_ip_address_vm_2

  }
}
