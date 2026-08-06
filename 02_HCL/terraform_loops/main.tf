terraform {
  required_version = ">= 1.9.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }

}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

data "aws_ami" "name" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

#예시 1 : count 사용한 반복
resource "aws_instance" "example1" {
  count         = 3
  ami           = data.aws_ami.name.id
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-${count.index}"
    # 결과예상 : example-instance-0, example-instance-1, example-instance-2
  }
}

#예시 2: for_each 사용한 반복
resource "aws_instance" "example2" {
  for_each      = toset(["dev", "staging", "prod"])
  ami           = data.aws_ami.name.id
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance-${each.key}"
    # 결과예상 : example-instance-dev, example-instance-staging, example-instance-prod
  }

}


# 예시 3: for을 이용한 반복문

locals {
  name_tags = [for name in var.instance_name : "Name-${name}"]
}

# 예시 4: dynamic
resource "aws_security_group" "example" {
  name = "example-sg" #sg는 security group의 약자

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}


