variable "resource_group_name" {}

variable "location" {}

variable  "common_tags" {}

variable "vnet_name" {
  type    = string
  default = "7054-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type    = string
  default = "7054-subnet"
}

variable "subnet_prefixes" {
  default = ["10.0.0.0/24"]
}

variable "nsg_name" {
  type    = string
  default = "7054-nsg"
}
