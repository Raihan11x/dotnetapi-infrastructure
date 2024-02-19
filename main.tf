terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

#ECS module
module "ecs" {
  source = "./modules/application"

  region                         = var.aws_region
  vpc_id                         = module.network.vpc_id
  ecs_cluster_name               = var.ecs_cluster_name
  ecs_task_family                = var.ecs_task_family
  ecs_task_cpu                   = var.ecs_task_cpu
  ecs_task_memory                = var.ecs_task_memory
  ecs_container_name             = var.ecs_container_name
  ecs_container_image            = var.ecs_container_image
  ecs_container_port             = var.ecs_container_port
  ecs_service_name               = var.ecs_service_name
  subnet_ids                     = module.network.public_subnet_ids
  ecs_service_desired_count      = var.ecs_service_desired_count
  alb_subnets                    = module.network.public_subnet_ids
  ecs_max_capacity               = var.ecs_max_capacity
  ecs_min_capacity               = var.ecs_min_capacity
  cpu_utilization_high_threshold = var.ecs_cpu_threshold
  ecs_scale_up_threshold         = var.ecs_cpu_scale_up
  ecs_scale_down_threshold       = var.ecs_cpu_scale_down
  ingress_cidr_alb               = [var.ingress_cidr_alb][0]
}

#Networking Module
module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidr
  availability_zones   = var.availability_zones
}

#RDS module
module "rds" {
  source = "./modules/dbase"

  allocated_storage                  = var.rds_allocated_storage
  storage_type                       = var.rds_storage_type
  engine                             = var.rds_engine
  engine_version                     = var.rds_engine_version
  instance_class                     = var.rds_instance_class
  db_name                            = var.rds_database_name
  db_username                        = var.rds_username
  db_password                        = var.rds_password
  db_parameter_family                = var.rds_parameter_group_family
  subnet_ids                         = module.network.private_subnet_ids
  rds_security_group                 = [module.ecs.alb_security_group_id]
  vpc_rds_id                         = module.network.vpc_id
  rds_instance_identifier             = var.rds_instance_identifier
  rds_cpu_utilization_high_threshold = var.rds_cpu_threshold
}