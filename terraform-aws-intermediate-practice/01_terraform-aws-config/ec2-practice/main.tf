# Terraform 설정 및 AWS provider 설정
terraform {
  required_version = ">= 1.9.6" # 최소 Terraform 버전 설정
  required_providers {
    aws = {
      source  = "hashicorp/aws" # AWS 프로바이더의 소스 지정
      version = ">= 5.73.0"     # 5.73 버전 이상의 AWS 프로바이더 사용
    }
  }
}

provider "aws" {
  region  = var.aws_region  # AWS 리전 (변수에서 지정)
  profile = var.aws_profile # AWS CLI 프로파일 (변수에서 지정)
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["*ubuntu*noble-24.04-amd64-server*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "ec2_example" {
  count                  = 3
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.subnet_example.id
  vpc_security_group_ids = [aws_security_group.sg-example.id]

  tags = {
    Name = "MyFirstInstance-${count.index + 1}"
  }
  lifecycle {
    create_before_destroy = true
  }
}



############################################################
# VPC와 보안그룹
############################################################

resource "aws_vpc" "vpc_example" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }


}

resource "aws_subnet" "subnet_example" {
  vpc_id            = aws_vpc.vpc_example.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_security_group" "sg-example" {
  vpc_id = aws_vpc.vpc_example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/16"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}
