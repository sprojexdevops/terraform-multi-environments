variable "instance_type" {
    type = map
    # the keys should match with the workspace names
    default = {
        dev = "t3.micro"
        prod = "t3.small"
    }
}