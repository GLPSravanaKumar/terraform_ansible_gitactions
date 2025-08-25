output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = data.aws_s3_bucket.example.arn
}
output "s3_bucket_domain_name" {
  description = "Domain name of the s3 bucket"
  value       = data.aws_s3_bucket.example.bucket_domain_name
}
