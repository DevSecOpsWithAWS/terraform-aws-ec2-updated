variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string 
  default    = "ami-09c813fb71547fc4f"  
}

variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the EC2 instance."
  type        = string
  default     = "subnet-0a0cf70a415b59000"
}

variable "ec2_tags" {
  type = map
  default = {
    Project = "Expense"
    Component = "Database"
    Environment = "Development"
    Name = "Expense-Database-Development"
  }
}

variable "from_port" {
  description = "The starting port for the security group rule."
  type        = number
  default     = 22
}

variable "to_port" {
  description = "The ending port for the security group rule."
  type        = number
  default     = 22
}
