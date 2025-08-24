terraform {
  backend "s3" {
    bucket = "backend-bucket-ansible"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    #  profile = "optum"
    encrypt        = true
    dynamodb_table = "glps_backend_lock_table"
  }
}


