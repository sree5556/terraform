resource "null_resource" "nothing" {
  depends_on = [aws_instance.sample]
}

//resource "aws_instance" "sample" {
//  count = 2
//  ami = "ami-0ed9d2e6b42fd9de7"
//  instance_type = "t2.micro"
//}

// Here ami is a argument, instance_type is an argument

output "PUBLIC_IP" {
  value = aws_instance.sample.*.public_ip
}

// .public_ip is a attribute.

provider "aws" {
  region = "us-east-2"
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  for_each = {
    80 = "1.1.1.1/32"
    443 = "2.2.2.2/32"
  }

  ingress {
    description = "TLS from VPC"
    from_port   = each.key
    to_port     = each.key
    protocol    = "tcp"
    cidr_blocks = [each.value]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}