output "ami_id" {
  value = data.aws_ami.joindevops.id
}
output "vpc_id" {
  value = data.aws_vpc.default.id
}