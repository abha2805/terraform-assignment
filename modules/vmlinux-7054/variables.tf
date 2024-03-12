variable "common_tags" {}

variable "resource_group_name" {}

variable "location" {}

variable "subnet_id" {}

variable "storage_account_uri" {}

variable "prefix" {
  default = "linux-7054"
}

variable "instance_count" {
  default = 3
}

variable "linux_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "abha"
}

variable "public_key_path" {
  default = "/home/abha28/.ssh/id_rsa.pub"
}

variable "private_key_path" {
  default = "/home/abha28/.ssh/id_rsa"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
}

variable "os_disk_size" {
  default = 30
}

variable "os_disk_caching" {
  default = "ReadWrite"
}

variable "ubuntu_publisher" {
  default = "OpenLogic"
}

variable "ubuntu_offer" {
  default = "CentOS"
}

variable "ubuntu_sku" {
  default = "8_2"
}

variable "ubuntu_version" {
  default = "latest"
}

variable "publisher_network_watcher" {
  default     = "Microsoft.Azure.NetworkWatcher"
}

variable "agent_type_network_watcher" {
  default     = "NetworkWatcherAgentLinux"
}

variable "publisher_azure_monitor" {
  default     = "Microsoft.Azure.Monitor"
}

variable "agent_type_azure_monitor" {
  default     = "AzureMonitorLinuxAgent"
}

