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
/* output "mangodb_project_id" {
  value = data.mongodbatlas_project.existing_project.id
}
output "mangodb_project_name" {
  value = data.mongodbatlas_project.existing_project.name
}
output "mangodb_proj_org_id" {
  value = data.mongodbatlas_project.existing_project.org_id
}
output "mangodb_proj_cluster_count" {
  value = data.mongodbatlas_project.existing_project.cluster_count
}
 */
output "public_subnet_ids" {
  value = module.aws_subnets.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.aws_subnets.private_subnet_ids
}
output "vpc_id" {
  value = module.aws_vpc.vpc_id
}
output "vpc_cidr_block" {
  value = module.aws_vpc.vpc_cidr_block
}
output "pub_sg_id" {
  value = module.aws_security_groups.pub_sg_id
}
output "private_sg_id" {
  value = module.aws_security_groups.private_sg_id
}
