variable "instance_family_image" {
  description = "Instance image"
  type        = string
  default     = "lamp"
}

variable "vpc_subnet_id" {
  description = "VPC subnet network id"
  type        = string
}

variable "vpc_subnet_zone" {

  description = "VPC subnet zone id"
  type        = string
}

variable "folder_id" {
  description = "Default folder ID in Yandex Cloud"
  type        = string
  default     = ""
}

variable "cloud_id" {
  description = "Default cloud ID in Yandex Cloud"
  type        = string
  default     = ""
}

variable "token" {
  description = "Default token Yandex Cloud"
  type        = string
  default     = ""
}
