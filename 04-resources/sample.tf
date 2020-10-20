resource "null_resource" "nothing" {
  //depends_on = [aws_instance.sample]
}

resource "aws_instance" "sample" {
  ami = "ami-0ed9d2e6b42fd9de7"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  lifecycle {
    create_before_destroy = true
  }

  provisioner "remote-exec" {

    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }
    inline = [
      "yum install nginx -y "
    ]

  }

}

// Here ami is a argument, instance_type is an argument

//output "PUBLIC_IP" {
//  value = aws_instance.sample.*.public_ip
//}

// .public_ip is a attribute.

provider "aws" {
  region = "us-east-2"
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"



  dynamic "ingress" {
    iterator = port
    for_each = {
      80 = "0.0.0.0/0"
      443 = "2.2.2.2/32"
      22 = "0.0.0.0/0"

    }
    content {
      from_port   = port.key
      to_port     = port.key
      protocol    = "tcp"
      cidr_blocks = [port.value]
    }
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

