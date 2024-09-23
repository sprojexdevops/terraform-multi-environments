variable "instance_type" {
  type = map(any)
  # the keys should match with the workspace names
  default = {
    dev  = "t3.micro"
    prod = "t3.small"
  }
}