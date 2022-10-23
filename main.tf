terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.81.0"
    }
  }
}

provider "yandex" {
  token                    = "auth_token_here"
  service_account_key_file = "path_to_service_account_key_file"
  cloud_id                 = "cloud_id_here"
  folder_id                = "folder_id_here"
  zone                     = "ru-central1-a"
}
