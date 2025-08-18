/* output "az" {
  value       = module.vpc.az
  description = "The availability zone where the VPC and subnet are created."
} */
output "az_rgname1" {
  value = module.az_resourcegroup.az_rgname1
}
output "az_rgname2" {
  value = module.az_resourcegroup.az_rgname2
}
output "mangodb_project_id" {
  value = module.mongodb.project_id
}
output "mangodb_project_name" {
  value = module.mongodb.project_name
}
