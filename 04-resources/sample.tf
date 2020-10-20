resource "null_resource" "nothing" {
  depends_on = [aws_instance.sample]
}

resource "aws_instance" "sample" {
  ami = "ami-0ed9d2e6b42fd9de7"
  instance_type = "t2.micro"
}

// Here ami is a argument, instance_type is an argument

output "PUBLIC_IP" {
  value = aws_instance.sample.public_ip
}

// .public_ip is a attribute.

