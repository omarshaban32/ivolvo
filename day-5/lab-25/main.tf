module "vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zone  = var.availability_zone
}

module "ec2" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = module.vpc.public_subnets[*]
  vpc_security_group_ids = [module.ec2.security_group_id]
}

module "rds" {
  source = "./modules/rds"
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = module.vpc.private_subnets
  vpc_security_group_ids = [module.rds.security_group_id]
}

