provider "aws" {
  version = "3.47.0"
  region     = "us-east-1"
  shared_credentials_file = "/home/{user}/.aws/credentials"
}

resource "aws_instance" "app-bd" {
  ami             = "ami-0c54494f920b19106" #ubuntu14.04
  instance_type   = "t2.micro"
  key_name        = "{key}"
  
  security_groups = ["allow-ssh", "allow-bd-access"]
}

resource "aws_instance" "app-server" {
  ami             = "ami-0c54494f920b19106" #ubuntu14.04
  instance_type   = "t2.nano"
  availability_zone = "us-east-1a"
  key_name        = "{key}"
  
  security_groups = ["allow-ssh", "allow-server-access"]
}

resource "aws_security_group" "allow-ssh" {
  name          = "allow-ssh"
  description   = "Permite SSH"

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

resource "aws_security_group" "allow-bd-access" {
  name          = "allow-bd-access"
  description   = "Permite conexao a base de dados"

  ingress {
    from_port   = 0
    to_port     = 3306
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

resource "aws_security_group" "allow-server-access" {
  name          = "allow-server-access"
  description   = "Permite conexao aos servers"

  ingress {
    from_port   = 9000
    to_port     = 9000
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