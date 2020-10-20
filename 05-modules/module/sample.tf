resource "local_file" "foo" {
  content     = "Line Number = ${var.line_number}\n"
  filename = "/tmp/foo.bar"
}

variable "line_number" {}