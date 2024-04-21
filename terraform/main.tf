######################
####### VPC ##########
######################

module "vpc" {
  source = "./modules/vpc"
  cidr   = var.cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support = var.enable_dns_support
  instance_tenancy = var.instance_tenancy
  create_vpc = var.create_vpc
  tags = var.tags
}

######################
###### SUBNETS #######
######################

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr_prefixes = var.public_subnet_cidr_prefixes
  private_subnet_cidr_prefixes = var.private_subnet_cidr_prefixes
  availability_zones = var.availability_zones
  igw_id = module.igw.igw_id
  tags = var.tags
}

######################
###### SECURITY GROUP #######
######################

module "sg" {
  source = "./modules/sg"
  alb_ingress_ports = var.alb_ingress_ports
  instance_ingress_ports = var.instance_ingress_ports
  vpc_id = module.vpc.vpc_id
  tags = var.tags
}

######################
###### INTERNET GATEWAY #######
######################

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  tags = var.tags
}

##################
##### ALB #######
################

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
  tags              = var.tags
}

######################
###### API GATEWAY  #######
######################

module "apigateway" {
  source = "./modules/apigateway"
  alb_arn = module.alb.alb_arn
  api_gateway_name = var.api_gateway_name
  vpc_link_name = var.vpc_link_name
  tags = var.tags
  alb_dnsname = module.alb.alb_dnsname
}

#####################
##### SSH-KEY #####
###################

# module "ssh_key" {
#   source = "./modules/ssh-key"
#   key_name = var.key_name
#   ssh_public_key = var.ssh_public_key
# }


#######################
#### EC2 instances #####
######################

module "ec2_instances" {
  source = "./modules/ec2-instances"
  private_subnet_ids = module.subnets.private_subnet_ids
  public_subnet_ids = module.subnets.public_subnet_ids
  tags = var.tags
  web_sg_id = module.sg.web_sg_id
}