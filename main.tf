module "az_resourcegroup" {
  source       = "./modules/az_resourcegroup"
  az_rgname1   = var.az_rgname1
  az_location1 = var.az_location1
  az_rgname2   = var.az_rgname2
  az_location2 = var.az_location2
}
/* module "mongodb" {
  source            = "./modules/mongodb"
  mongodb_proj_name = var.mongodb_proj_name
} */
module "aws_s3_bucket" {
  source      = "./modules/aws_s3_bucket"
  bucket_name = var.bucket_name
  env         = var.env
}

data "mongodbatlas_project" "existing_project" {
  name = var.mongodb_proj_name
}

resource "mongodbatlas_project_ip_access_list" "allow_all" {
  project_id = data.mongodbatlas_project.existing_project.id
  cidr_block = "160.238.72.164/32"
  comment    = "Allow all IPs"
}
