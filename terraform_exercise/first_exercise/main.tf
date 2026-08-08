variable "greeting" {
  default = "Hello, Terraform!"
  type    = string
}

output "print_greeting" {
  description = "변수 출력"
  value       = "The greeting message is: <${var.greeting}>"
}
