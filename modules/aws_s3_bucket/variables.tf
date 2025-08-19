variable "bucket_name" {
  description = "The name of the S3 bucket to create."
}

variable "env" {
  description = "The environment for which the S3 bucket is being created (e.g., dev, test, prod)."
}
