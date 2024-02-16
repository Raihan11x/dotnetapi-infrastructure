#VPC Cidr 
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

#Public Subnet
variable "public_subnet_cidrs" {
  description = "The list of CIDR blocks for the public subnets"
  type        = list(string)
}

#Private Subnet
variable "private_subnet_cidrs" {
  description = "The list of CIDR blocks for the private subnets"
  type        = list(string)
}

#Availability Zones
variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
}