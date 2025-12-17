nsg_rules = {
  ssh = {
    priority = 100
    port     = "22"
  }
  http = {
    priority = 200
    port     = "80"
  }
}
