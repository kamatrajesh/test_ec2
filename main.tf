provider "aws" {
  region = var.region
}

data "aws_ami" "redhat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["redhat/images/hvm-ssd/ami-09d56f8956ab235b3*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
