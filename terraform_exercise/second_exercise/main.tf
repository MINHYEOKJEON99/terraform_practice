variable "is_day" {
  type    = bool
  default = true
}

locals {
  greeting = var.is_day ? "Good day!" : "Good night!"
}

output "print_greeting" {
  description = "조건문에 따른 greeting 출력"
  value       = local.greeting
}
