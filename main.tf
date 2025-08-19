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

data "mongodbatlas_project" "existing_project" {
  name = var.mongodb_proj_name
}
