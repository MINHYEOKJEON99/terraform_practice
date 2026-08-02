
########################################################

# enable_monitoring 변수
variable "enable_monitoring" {
  description = "인스턴스에 대한 모니터링 활성화 여부를 결정함"
  type        = bool
  default     = true
}

# environment 변수
variable "environment" {
  description = "인스턴스가 배포되는 환경입니다. 이 변수에 따라 인스턴스 사양이 변경됩니다."
  type        = string
  default     = "dev"
}

# S3 버킷 생성 여부 변수
variable "create_bucket" {
  description = "S3 버킷 생성 여부 결정"
  type        = bool
  default     = true
}

# region 변수
variable "region" {
  description = "AWS 리전 설정"
  type        = string
  default     = "us-east-1"
}

# 사용자 데이터 변수
variable "custom_user_data" {
  description = "사용자 데이터 스크립트"
  type        = string
  default     = ""
}

