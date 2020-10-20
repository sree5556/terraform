// This is a string
variable "color" {
  default = "Red"
}

// This is a number, can be float (1.111)
variable "colorcode" {
  default = 31
}

// This is a boolean, can be true or false
variable "bool" {
  default = true
}

output "COLOR" {
  value = var.color
}

output "COLORCODE" {
  value = var.colorcode
}

output "BOOLAEAN" {
  value = var.bool
}

// Variable gives in quotes can be accessed only with ${} interpolation
output "LINE" {
  value = "Color is ${var.color}"
}
