resource "aws_instance" "myec2" {
  ami           = "ami-00aa4671cbf840d82"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.mysg.name]
  key_name = "terraform"

  provisioner "file" {
    source      = "files/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo mv -f /tmp/index.html /usr/share/nginx/html/index.html",
      "sudo systemctl start nginx"
    ]
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("files/terraform.key")
    host = self.public_ip
  }

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "mysg" {
  name        = "mysg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
