module "az_resourcegroup" {
  source       = "./modules/az_resourcegroup"
  az_rgname1   = var.az_rgname1
  az_location1 = var.az_location1
  az_rgname2   = var.az_rgname2
  az_location2 = var.az_location2
}

module "aws_s3_bucket" {
  source      = "./modules/aws_s3_bucket"
  bucket_name = var.bucket_name
}

module "aws_vpc" {
  source         = "./modules/aws_vpc"
  vpc_cidr_block = var.vpc_cidr_block
}

module "aws_subnets" {
  source               = "./modules/aws_subnets"
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  vpc_id               = module.aws_vpc.vpc_id
}
module "aws_route_tables" {
  source               = "./modules/aws_route_tables"
  vpc_id               = module.aws_vpc.vpc_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_ids    = module.aws_subnets.public_subnet_ids
  private_subnet_ids   = module.aws_subnets.private_subnet_ids
}
module "aws_security_groups" {
  source = "./modules/aws_security_groups"
  vpc_id = module.aws_vpc.vpc_id
}
module "aws_ec2" {
  source = "./modules/aws_ec2"
}

/* module "mongodb" {
  source            = "./modules/mongodb"
  mongodb_proj_name = var.mongodb_proj_name
} */

/* data "mongodbatlas_project" "existing_project" {
  name = var.mongodb_proj_name
}

resource "mongodbatlas_project_ip_access_list" "allow_all" {
  project_id = data.mongodbatlas_project.existing_project.id
  cidr_block = "160.238.72.164/32"
  comment    = "Allow all IPs"
}
 */
