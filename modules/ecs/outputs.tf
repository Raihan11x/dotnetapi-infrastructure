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

