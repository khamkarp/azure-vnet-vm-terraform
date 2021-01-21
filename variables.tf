variable "resource_group_name" {
  type = string
  default = "UAT-RG"
}

variable "naming_prefix" {
  type    = string
  default = "itma"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "vm_count" {
  type    = number
  default = 1
}

locals {
  prefix = "${terraform.workspace}-${var.naming_prefix}"
}

variable "vnet_cidr_range" {
  type    = string
  default = "10.0.0.0/16"
}

#variable "subnet_prefixes" {
#  type    = list(string)
#  default = ["10.0.0.0/24", "10.0.1.0/24"]
#}

variable "subnet_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1"]
}
