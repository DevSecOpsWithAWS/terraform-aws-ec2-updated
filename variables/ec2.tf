resource "aws_instance" "database" {
  ami = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_all-1.id]
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  tags = var.ec2_tags
}

resource "aws_security_group" "allow_all-1"{
  name = "allow_all-1"
  description = "Allow all inbound traffic  for testing"
  
  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "AllowAllSecurityGroup"
  }
}