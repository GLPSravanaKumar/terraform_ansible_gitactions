data "mongodbatlas_project" "existing_project" {
  name = "glps_project" # Or use project_id = "your_project_id"
}

data "mongodbatlas_cluster" "existing_cluster" {
  project_id = data.mongodbatlas_project.existing_project.id
  name       = "Cluster0"
}
