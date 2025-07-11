resource "aws_instance" "expense" {
  ami = data.aws_ami.joindevops.id
  vpc_security_group_ids = [aws_security_group.allow_all-1.id]
  for_each = var.instances
  instance_type = each.value
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  tags = merge(
    var.common_tags,
    {
    Name = each.key
    }
  )
}

resource "aws_security_group" "allow_all-1"{
  name = "allow_all-1"
  description = "Allow all inbound traffic  for testing"
  
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      protocol = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "AllowAllSecurityGroup"
  }
}