#Output for cluster id
output "cluster_id" {
  value       = aws_ecs_cluster.cluster.id
  description = "The ID of the ECS cluster"
}

#Output for service name
output "service_name" {
  value       = aws_ecs_service.service.name
  description = "The name of the ECS service"
}

#Output for task definition
output "task_definition_arn" {
  value       = aws_ecs_task_definition.task_definition.arn
  description = "The ARN of the ECS task definition"
}

#Output for security group alb
output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "The ID of the security group for the ECS cluster"
}

#Output for vpc id
output "vpc_id" {
  value       = var.vpc_id
  description = "The VPC ID for the ECS cluster"
}
