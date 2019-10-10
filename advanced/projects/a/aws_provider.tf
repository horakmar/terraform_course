provider "aws" {
  region     = "eu-central-1"
  access_key = file("../../../../course.access")
  secret_key = file("../../../../course.secret")
}
