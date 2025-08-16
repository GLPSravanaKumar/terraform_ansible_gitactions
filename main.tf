module "vpc" {
  source = "/modules/vpc"
  az     = data.aws_availability_zones.example.names[0]
}
