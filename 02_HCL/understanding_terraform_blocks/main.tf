resource "local_file" "example" {
  # path.module은 지금 폴더를 경로로 지정한다는 뜻(해당 main.tf가 속해있는 폴더의 경로)
  # /Users/jeonminhyeok/practice/terraform-practice/02_HCL/understanding_terraform_blocks/main.tf
  filename = "${path.module}/${var.filename}"
  content  = "Hello, Terraform!"
}
