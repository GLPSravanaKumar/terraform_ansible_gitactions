output "project_id" {
  value = data.mongodbatlas_project.existing_project.id
}
output "cluster_state" {
  value = data.mongodbatlas_cluster.existing_cluster.state_name
}

output "cluster_connection_strings" {
  value = data.mongodbatlas_cluster.existing_cluster.connection_strings
}
