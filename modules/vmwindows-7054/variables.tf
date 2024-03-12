variable "common_tags" {}

variable "resource_group_name" {}

variable "location" {}

variable "subnet_id" {}

variable "storage_account_uri" {}

variable "instance_count" {
  default = 1 
}

variable "admin_username" {
  default = "abha"
}

variable "admin_password" {
  default = "Abha@2805"
}

variable "windows_size" {
  default = "Standard_B1s"
}

variable "windows_name" {
  default =  "windows-7054"
}

variable "win_storage_account_type" {
  description = "Storage account type for windows "
  type        = string
  default     = "StandardSSD_LRS"
}

variable "win_disk_size" {
  description = "Size of the win disk in gigabytes"
  type        = number
  default     = 128
}

variable "win_disk_caching" {
  description = "Caching type for windows"
  type        = string
  default     = "ReadWrite"
}

variable "windows_publisher" {
  description = "Publisher for the Windows"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  description = "Offer for the Windows"
  type        = string
  default     = "WindowsServer"
}


variable "windows_sku" {
  description = "Sku for the windows"
  type        = string
  default     = "2016-Datacenter"
}

variable "windows_version" {
  description = "Version of the windows"
  type        = string
  default     = "latest"
}

variable "windows_avs" {
  description = "Windows availability Set"
  default     = "windows_avs"

}
