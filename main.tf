data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*22.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

provider "aws" {
  region  = "us-west-2"
}

#create security group for ec2 instance
#with full access to your ip and open ports 80 and 443 for public access
resource "aws_security_group" "bonpland_sg" {
  name        = "bonpland_sg"
  description = "configuration ports for api and front"
  #ports 22, 80 and 443 for everyone
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## create instance
resource "aws_instance" "bonpland_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = "bonpland-ssh-key"
    security_groups = ["bonpland_sg"]

  tags = {
    Name = var.ec2_name
  }
  #Bootstrap app installation and start
  user_data = file("bootstrap.sh")
  #user_data = <<-EOF
  ##!/bin/bash
  #    sudo apt -y remove needrestart
  #    sudo apt update
  #    sudo apt -y install apache2
  #    sudo bash -c 'echo "bonpland app dev" > /var/www/html/index.html'
  #EOF

  user_data_replace_on_change = true

}

#assign an elastic ip and show the ip
resource "aws_eip" "ip" {
  instance = aws_instance.bonpland_server.id
}
output "ip" {
  value = aws_instance.bonpland_server.public_ip
}
