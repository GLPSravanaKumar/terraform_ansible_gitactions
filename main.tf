module "mongodb" {
  source            = "git::https://github.com/GLPSravanaKumar/terraform_ansible_gitactions.git//modules/mongodb"
  atlas_public_key  = var.atlas_public_key
  atlas_private_key = var.atlas_private_key
  project_id        = var.project_id
}
