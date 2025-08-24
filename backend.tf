terraform {
  backend "s3" {
    bucket = "uhg-s3-backend-table"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #  profile = "optum"
    encrypt = true
    #  dynamodb_table = "glps_backend_lock_table"
  }
}


