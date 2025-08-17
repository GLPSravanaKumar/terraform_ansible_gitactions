output "az" {
  value       = module.vpc.az
  description = "The availability zone where the VPC and subnet are created."
}
