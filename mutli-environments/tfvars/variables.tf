variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    Environment = "dev"
  }
}


variable "instances" {
  default = ["mysql", "backend", "frontend"]
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

variable "project" {
  default = "expense"
}

variable "environment" {
  
}