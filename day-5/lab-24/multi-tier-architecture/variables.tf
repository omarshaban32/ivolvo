variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}



variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "private_subnet_cidrs" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zone" {
  description = "The availability_zone for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}


variable "ami" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-00beae93a2d981137"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
}

variable "db_engine_version" {
  description = "The engine version for the RDS instance"
  default     = "8.0.35"
}

variable "db_username" {
  description = "The username for the RDS instance"
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS instance"
  default     = "password123"
}

