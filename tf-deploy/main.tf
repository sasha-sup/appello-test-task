terraform {
  required_version = ">= 1.2.6"
}

provider "aws" {
  region  = "us-east-1"
}

data "template_file" "user_data" {
  template = file("user-data.sh")
  vars = {
    nginx-port = var.nginx-port
  }
}

resource "aws_instance" "appello_test" {
  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.appello_test_security_group.id]
  user_data       = data.template_file.user_data.rendered
  key_name = aws_key_pair.appello-key.id
  tags = {
    Name    = "nginx 404 example"
    Project = "Appello Test Task"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_key_pair" "appello-key" {
	public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "appello_test_security_group" {
  name        = "appello-test-security-group"
  description = "appello test security group"

  ingress {
    from_port   = var.nginx-port
    to_port     = var.nginx-port
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
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}