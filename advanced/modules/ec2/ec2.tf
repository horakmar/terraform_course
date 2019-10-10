resource "aws_instance" "myec2" {
  ami = "ami-00aa4671cbf840d82"
  instance_type = "${lookup(var.instance_type, terraform.workspace)}"

}
