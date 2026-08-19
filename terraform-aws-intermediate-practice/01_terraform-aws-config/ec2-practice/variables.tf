variable "aws_region" {
  description = "리소스를 배포할 AWS 리전" # AWS 리전 설명
  type        = string            # 문자열 타입
  default     = "us-east-1"       # 기본값: us-east-1
}

variable "aws_profile" {
  description = "사용할 AWS CLI 프로파일" # AWS CLI 프로파일 설명
  type        = string             # 문자열 타입
  default     = "my-profile"       # 기본값: my-sso
}

variable "vpc_cidr_block" {
  description = "VPC에 할당할 CIDR 블록"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "서브넷에 할당할 CIDR 블록"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "서브넷을 배치할 가용영역"
  type        = string
  default     = "us-east-1a"
}
