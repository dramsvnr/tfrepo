variable "resource_groups" {
  type = map(string)
  default = {
    dev  = "East US"
    qa   = "West US"
    prod = "Central US"
  }
}
