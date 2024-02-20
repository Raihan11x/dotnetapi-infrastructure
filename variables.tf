# Region of AWS
variable "aws_region" {
  description = "The region of AWS"
  type        = string
}

# VPC Configuration
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

# Public Subnet
variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
}

# Private Subnet
variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = list(string)
}

# Availability Zones
variable "availability_zones" {
  description = "The availability zones for the VPC"
  type        = list(string)
}

# ECS
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

# ECS Task Family
variable "ecs_task_family" {
  description = "The name of the ECS task family"
  type        = string
}

# ECS Task CPU
variable "ecs_task_cpu" {
  description = "The CPU for the ECS task"
  type        = string
}

# ECS Task Memory
variable "ecs_task_memory" {
  description = "The memory for the ECS task"
  type        = string
}

# ECS  Container Port
variable "ecs_container_port" {
  description = "The container port for the ECS task"
  type        = number
}

# ECS Container Name
variable "ecs_container_name" {
  description = "The name of the ECS container"
  type        = string
}

# ECS Container Image
variable "ecs_container_image" {
  description = "The image for the ECS container"
  type        = string
}

# ECS Service Name
variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

# ECS Service Desired Count
variable "ecs_service_desired_count" {
  description = "The desired count for the ECS service"
  type        = number
}

# ECS CPU Threshold
variable "ecs_cpu_threshold" {
  description = "The CPU threshold for the ECS service"
  type        = number
}

# ECS Max Capacity
variable "ecs_max_capacity" {
  description = "The max capacity for the ECS service"
  type        = number
}

# ECS Min Capacity
variable "ecs_min_capacity" {
  description = "The min capacity for the ECS service"
  type        = number
}

# ECS CPU Scale up
variable "ecs_cpu_scale_up" {
  description = "The CPU scale up for the ECS service"
  type        = number
}

# ECS CPU Scale down
variable "ecs_cpu_scale_down" {
  description = "The CPU scale down for the ECS service"
  type        = number
}

# RDS Allocated Storage
variable "rds_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  type        = number
}

# RDS Storage Type
variable "rds_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
}

# RDS Engine
variable "rds_engine" {
  description = "The engine for the RDS instance"
  type        = string
}

# RDS Engine Version
variable "rds_engine_version" {
  description = "The engine version for the RDS instance"
  type        = string
}

# RDS Instance Class
variable "rds_instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
}

# RDS Username
variable "rds_username" {
  description = "The username for the RDS instance"
  type        = string
}

# RDS Password
variable "rds_password" {
  description = "The password for the RDS instance"
  type        = string
}

# RDS Database Name
variable "rds_database_name" {
  description = "The name of the RDS database"
  type        = string
}

# RDS Parameter Group Family
variable "rds_parameter_group_family" {
  description = "The parameter group family for the RDS instance"
  type        = string
}

# RDS instance identifier
variable "rds_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

# RDS CPU Threshold
variable "rds_cpu_threshold" {
  description = "The CPU threshold for the RDS instance"
  type        = number
}

#ingress
variable "ingress_cidr_alb" {
  description = "The ingress for the security group"
  type        = list(string)
}