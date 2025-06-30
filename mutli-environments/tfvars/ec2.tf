resource "aws_instance" "expense" {
  count = length(var.instances)
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.allow_all-1.id]
  instance_type = "t3.micro"
  subnet_id = "subnet-0a0cf70a415b59000"
  associate_public_ip_address = true
  tags = merge(
    var.common_tags,
    {
      Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    }
  )
}

resource "aws_security_group" "allow_all-1"{
  name = "${var.project}-${var.environment}"
  description = "Allow all inbound traffic  for testing"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}"
  }
}