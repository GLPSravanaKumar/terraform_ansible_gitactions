variable "az_rgname1" {
  description = "Name of the first Azure Resource Group"
}

variable "az_location1" {
  description = "Azure region for the first Resource Group"
}

variable "az_rgname2" {
  description = "Name of the second Azure Resource Group"
}

variable "az_location2" {
  description = "Azure region for the second Resource Group"
}

variable "mongodb_proj_name" {
  description = "Name of the MongoDB Atlas project"
}

/*
variable "MONGODB_ATLAS_PUBLIC_KEY" {
  description = "MongoDB Atlas Public API Key"
}
variable "MONGODB_ATLAS_PRIVATE_KEY" {
  description = "MongoDB Atlas Private API Key"
}
*/

variable "bucket_name" {
  description = "Name of the storage bucket"
}


variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "vpc_cidr_block" {
  description = "VPC Cidr block"
  type        = string
}
