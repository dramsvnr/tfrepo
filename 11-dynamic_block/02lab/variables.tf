variable "nsg_rules" {
  type = map(object({
    priority = number
    port     = string
  }))
}
