
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
  security_group_ids             = aws_security_group.ecs_sg.id
  ecs_service_desired_count      = var.ecs_service_desired_count
  alb_security_group_id          = aws_security_group.alb_sg.id
  alb_subnets                    = module.network.public_subnet_ids
  ecs_max_capacity               = var.ecs_max_capacity
  ecs_min_capacity               = var.ecs_min_capacity
  cpu_utilization_high_threshold = var.ecs_cpu_threshold
  ecs_scale_up_threshold         = var.ecs_cpu_scale_up
  ecs_scale_down_threshold       = var.ecs_cpu_scale_down
}

#Networking Module
module "network" {
  source = "./modules/network"

  vpc_cidr             = module.network.vpc_id
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
  security_group_id                  = aws_security_group.rds_sg.id
  rds_instance_identifier            = var.rds_instance_identifier
  rds_cpu_utilization_high_threshold = var.rds_cpu_threshold
}

#Security group for RDS
resource "aws_security_group" "rds_security_group" {
  name        = "rds_security_group"
  description = "Allow inbound traffic"
  vpc_id      = module.networking.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

#Security group for ECS
resource "aws_security_group" "ecs_security_group" {
  name        = "ecs_security_group"
  description = "Allow inbound traffic"
  vpc_id      = module.networking.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_security_group.alb_security_group_id.id]
  }
}

#Security group for ALB
resource "aws_security_group" "alb_security_group" {
  name        = "alb_security_group"
  description = "Allow inbound traffic"
  vpc_id      = module.networking.vpc_id

  ingress = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
