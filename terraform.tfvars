aws_region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]

private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]

availability_zones = ["us-east-1a", "us-east-1b"]

ecs_cluster_name = "my-ecs-cluster"

ecs_task_family = "my-ecs-task-family"

ecs_task_cpu = "256"

ecs_task_memory = "512"

ecs_container_port = 80

ecs_container_name = "my-ecs-container"

ecs_container_image = "nginx:latest"

ecs_service_name = "my-ecs-service"

ecs_service_desired_count = 2

ecs_cpu_threshold = ""

ecs_max_capacity = ""

ecs_min_capacity = ""

ecs_cpu_scale_up = ""

ecs_cpu_scale_down = ""

rds_allocated_storage = 20

rds_storage_type = "gp2"

rds_engine = "mysql"

rds_engine_version = "5.7"

rds_instance_class = "db.t2.micro"

#Use KMS for password encryption
rds_username = "admin"

rds_password = "password"

rds_database_name = "mydb"

rds_parameter_group_family = "mysql5.7"

rds_instance_identifier = "my-rds-instance"

rds_cpu_threshold = ""

ingress_cidr_alb = ["86.9.22.0/24"]
