resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = "web-server"
  }
}



