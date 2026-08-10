module "my_greeting" {
  source         = "./modules/greeting"
  greeting       = "Hello"
  message_prefix = "Welcome: "
}

output "print_module_output" {
  value = module.my_greeting.greeting_msg
}
