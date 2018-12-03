variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  default = "default"
}

variable "azs" {
  type    = "list"
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "web_cidrs" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "rds_cidrs" {
  type    = "list"
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24"]
}

variable "web_ami" {
  type = "map"

  default = {
    ap-south-1 = "ami-0bc6e84391ec20816"
    us-east-1  = "ami-09479453c5cde9639"
  }
}
