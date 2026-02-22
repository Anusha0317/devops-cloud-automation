provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c1ac872bdc2c19e3"
  instance_type = "t3.micro"
  key_name      = "anu-key"

  tags = {
    Name = "DevOps-Cloud-Automation"
  }
}
