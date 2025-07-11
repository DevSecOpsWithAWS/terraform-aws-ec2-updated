variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string 
  default    = "ami-09c813fb71547fc4f"  
}

/* variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
  default     = "t2.micro"
} */

/* variable "instances" {
  default = ["mysql", "backend", "frontend"]
} */

variable "environment"{
  description = "The environment for the EC2 instance (e.g., Development, Production)."
  type        = string
  default     = "prod"
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

variable "zone_id" {
  description = "The ID of the Route 53 hosted zone."
  type        = string
  default     = "Z04987052ECGSU780E7WV"
  
}

variable "domain_name" {
  description = "The domain name for the Route 53 record."
  type        = string
  default     = "sridevsecops.store"
  
}

variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    Environment = "dev"
  }
}

variable "ingress_ports"{
  default = [
    {
      from_port = 22
      to_port  = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 8080
      to_port  = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 3306
      to_port  = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port = 80
      to_port  = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "instances" {
  type = map
  default = {
    mysql = "t3.small"
    backend = "t3.medium"
    frontend = "t3.large"
  }
}