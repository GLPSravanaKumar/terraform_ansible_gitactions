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
output "keypair_id" {
  value = module.aws_ec2.keypair_id
}
output "public_route_table_ids" {
  value = module.aws_route_tables.public_route_table_ids
}
output "private_route_table_ids" {
  value = module.aws_route_tables.private_route_table_ids
}
output "nat_gw_ids" {
  value = module.aws_route_tables.nat_gw_ids
}
output "ami_image_id" {
  value = module.aws_ec2.ami_image_id
}
output "aws_instance_id" {
  value = module.aws_ec2.aws_instance_id
}
output "public_server_ip" {
  value = module.aws_ec2.public_server_ip
}
output "s3_bucket_arn" {
  value = module.aws_s3_bucket.s3_bucket_arn
}
output "s3_bucket_domain_name" {
  value = module.aws_s3_bucket.s3_bucket_domain_name
}
