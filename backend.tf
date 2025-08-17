resource "aws_dynamodb_table" "tf_lock" {
  name         = "tf-lock-ansible"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


terraform {
  backend "s3" {
    bucket  = "backend-bucket-ansible"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    profile = "optum"
    encrypt = true
    #  dynamodb_table = "tf-lock-ansible"
  }
}


