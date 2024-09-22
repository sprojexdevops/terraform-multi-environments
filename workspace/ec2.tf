resource "aws_instance" "terraform_workspace" {

  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform_workspace.id]
  tags = {
    Name = "terraform_workspace_${terraform.workspace}"
  }
}


resource "aws_security_group" "allow_ssh_terraform_workspace" {
  name        = "allow_ssh_terraform_workspace_${terraform.workspace}"
  description = "allow ssh 22 from terraform"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    "Name" = "allow_ssh_terraform_workspace_${terraform.workspace}"
  }

}