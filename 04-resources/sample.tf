resource "null_resource" "nothing" {}

resource "aws_instance" "sample" {
  ami = "973714476881"
  instance_type = "t2.micro"
}