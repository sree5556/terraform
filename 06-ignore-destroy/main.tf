resource "aws_instance" "instance" {
  ami = "ami-0ed9d2e6b42fd9de7"
  instance_type = "t2.micro"
}