# Region
variable "region" {
  description = "region for ECS"
  type        = string
}

#cluster name
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

#task CPU
variable "ecs_task_cpu" {
  description = "The CPU for the ECS task"
  type        = string
}

#task memory
variable "ecs_task_memory" {
  description = "The memory for the ECS task"
  type        = string
}

#task family
variable "ecs_task_family" {
  description = "The name of the ECS task family"
  type        = string
}

#container port
variable "ecs_container_port" {
  description = "The container port for the ECS task"
  type        = number
}

#container name
variable "ecs_container_name" {
  description = "The name of the ECS container"
  type        = string
}

#container image
variable "ecs_container_image" {
  description = "The image for the ECS container"
  type        = string
}

#subnet
variable "subnet_ids" {
  description = "The subnet IDs for the ECS cluster"
  type        = list(string)
}

#security group
# variable "security_group_ids" {
#   description = "The security group IDs for the ECS cluster"
#   type        = list(string)
# }

#service name
variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

#desired count
variable "ecs_service_desired_count" {
  description = "The desired count for the ECS service"
  type        = number
}

# vpc id
variable "vpc_id" {
  description = "The VPC ID for the ECS cluster"
  type        = string
}

#alb security group ID
# variable "alb_security_group_id" {
#   description = "The security group ID for the ALB"
#   type        = string
# }

#alb subnets
variable "alb_subnets" {
  description = "The subnets for the ALB"
  type        = list(string)
}

#cpu utilization high threshold
variable "cpu_utilization_high_threshold" {
  description = "The high threshold for CPU utilization"
  type        = number
}

#max capacity
variable "ecs_max_capacity" {
  description = "The max capacity for the ECS service"
  type        = number
}

#min capacity
variable "ecs_min_capacity" {
  description = "The min capacity for the ECS service"
  type        = number
}

#scale up threshold
variable "ecs_scale_up_threshold" {
  description = "The scale up threshold for the ECS service"
  type        = number
}

#scale down threshold
variable "ecs_scale_down_threshold" {
  description = "The scale down threshold for the ECS service"
  type        = number
}

#variable ingress cidr
variable "ingress_cidr_alb" {
  description = "The ingress CIDR for the security group"
  type        = list(string)
}

