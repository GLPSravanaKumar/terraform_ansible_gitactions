terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = local.aws_creds.AWS_ACCESS_KEY_ID
  secret_key = local.aws_creds.AWS_SECRET_ACCESS_KEY
}

data "aws_secretsmanager_secret" "secret" {
  name = "optum_access_key"
}

data "aws_secretsmanager_secret_version" "secret_value" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

locals {
  aws_creds = jsondecode(data.aws_secretsmanager_secret_version.secret_value.secret_string)
}
