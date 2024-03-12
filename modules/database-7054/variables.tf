variable "common_tags" {}

variable "resource_group_name" {}

variable "location" {}

variable "sku_name" {
  default = "B_Gen5_1"
}

variable "postgresql_version" {
    default = "10"
}

variable "administrator_login" {
    default = "abha"
}

variable "administrator_login_password" {
    default = "Password1234!"
}
