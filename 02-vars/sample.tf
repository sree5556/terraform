####### DATA TYPES
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

###### Variable Types
//list
variable "COLORS" {
  default = ["RED", "GREEN", "YELLOW", 40, false]
}
// A list supports different data types.

//Map
variable "COLORMAPS" {
  default = {
    RED = 31
    GREEN = 32
    YELLOW = 33
  }
}

output "COLOR_FROM_LIST" {
  value = var.COLORS[2]
}

output "COLOR_FROM_MAP" {
  value = var.COLORMAPS["RED"]
}

// Access variables from shell environment variables

variable "FRUIT_NAME" {}

output "FRUIT_NAME" {
  value = var.FRUIT_NAME
}

// When we prompt an input from user, and if he gives a wrong input then a validation should happen.
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}