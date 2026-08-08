variable "cities" {
  type    = list(string)
  default = ["Seoul", "Tokyo", "New York"]
}

locals {
  cities = [for city in var.cities : "City:${city}"]
}

output "print_cities" {
  value = local.cities
}
