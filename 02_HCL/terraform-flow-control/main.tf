terraform {
  required_version = ">= 1.11.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}


# 예시2 : 동적인 값 할당
locals {
  instance_type = var.environment == "prod" ? "m5.large" : "t2.micro"
}

# 예시 4 : 맵을 통한 조건 값 선택
locals {
  ami_map = {
    "us-east-1" : "ami-02b64aa047cb5edf5"
    "us-west-2" : "ami-0e0d2e3754385cbd3"
  }

  selected_ami = local.ami_map[var.region != "" ? var.region : "us-east-1"]

}

# EC2 인스턴스 생성
resource "aws_instance" "example" {
  ami           = local.selected_ami
  instance_type = local.instance_type

  monitoring = var.enable_monitoring
  user_data  = var.custom_user_data != "" ? var.custom_user_data : null
}

# 예시 3: 조건에 따른 리소스 생성 제어
resource "aws_s3_bucket" "name" {
  count  = var.create_bucket ? 1 : 0
  bucket = "my-example-bucket-202608"
}

