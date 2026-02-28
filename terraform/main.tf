provider "aws" {
  region = var.region
}

# Get latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Use existing Security Group
data "aws_security_group" "web_sg" {
  name = "devops-sg"
}

# Use existing Key Pair
data "aws_key_pair" "deployer" {
  key_name = "anu-key"
}

# Create EC2 instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = data.aws_key_pair.deployer.key_name
  vpc_security_group_ids = [data.aws_security_group.web_sg.id]

  tags = {
    Name = "DevOps-Cloud-Automation"
  }
}
