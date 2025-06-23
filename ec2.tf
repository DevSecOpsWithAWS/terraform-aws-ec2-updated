resource "aws_instance" "database" {
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  instance_type = "t2.micro"
  tags = {
    Name = "DatabaseInstance"
  }
}

resource "aws_security_group" "allow_all"{
  name = "allow_all"
  description = "Allow all inbound traffic  for testing"
  
  ingress {
    from_port = 22
    to_port = 22
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