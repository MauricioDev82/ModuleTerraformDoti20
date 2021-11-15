terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id     = "subnet-013b710125e49d6a7"
  ami= "ami-0e66f5495b4efdd0f"
  security_groups = ["$(var.securityg_id)"]
  instance_type = "t2.micro"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }

  
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
}
