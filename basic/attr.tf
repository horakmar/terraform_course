resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "attr-demo-01"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}

resource "aws_key_pair" "horakmar" {
  key_name   = "horakmar-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCv5LYWefe9q1LZjXQET7VH0g6hRYRxcpDJrZCNseL5pZD1XTkAt9rL9VGYgEI92Apyt75lvhfmZ0hegmB5z+ecMqkWlvJT2VMjK1NL1sFbKvVBO528Gxr3m2D4P0VZXo/SmgePeFfsomdneACacxguKm1et00yW+Sago2KWe5RjjTOwEYoaaKPHN/CaclRHoyDLvvIwPmSmZ0VJu2mlWD1UMGeYS7Yv81tRolNLg4R3EQoFJDpwF9S774w4MT9CBJIXkqdDxMayu407ReC0gqW50dNMLSDaXr71CXNk7a99e1EOi8MpAPZBzOR+oNCO2AJVyvUODDpkX2OsnHs+90x horakmar@lotr-20160512"
}

