output "az" {
  value       = module.vpc.az
  description = "The availability zone where the VPC and subnet are created."
}
output "project_id" {
  value       = module.mongodb.project_id
  description = "MongoDB Atlas project ID."
}
output "cluster_state" {
  value       = module.mongodb.cluster_state
  description = "State of the MongoDB Atlas cluster."
}
output "cluster_connection_strings" {
  value       = module.mongodb.cluster_connection_strings
  description = "Connection strings for the MongoDB Atlas cluster."
}
