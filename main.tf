#provider "aws" {
  #version = "~> 4.0"
 # region  = "us-east-1"
 # access_key = "AKIAUGXHYY6KUIWZCFF5"
 # secret_key = "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"
#}

resource "aws_security_group" "allow_tls" {
  name        = "ports for wordpress"
  description = "Allow HTTP and SSH"
  vpc_id      = "vpc-0cd730933cbb25687"


  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

 
    ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_instance" "wordpress" {
  ami           = var.ec2_ami_id
  instance_type = var.ec2_instance_type
  security_groups = [aws_security_group.allow_tls.name]
  key_name = aws_key_pair.deployer.id
  user_data = "${file("init.sh")}"

  tags = {
    Name = "WordPressTF"
  }
}