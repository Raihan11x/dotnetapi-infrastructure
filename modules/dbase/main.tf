resource "aws_kms_key" "rds_encryption" {
  description = "KMS key for RDS encryption"
}

resource "aws_db_instance" "default" {
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  db_name                             = var.db_name
  username                            = var.db_username
  password                            = var.db_password
  parameter_group_name                = aws_db_parameter_group.default.name
  db_subnet_group_name                = aws_db_subnet_group.default.name
  vpc_security_group_ids              = [aws_security_group.rds_sg.id]
  storage_encrypted                   = true
  kms_key_id                          = aws_kms_key.rds_encryption.arn
  publicly_accessible                 = false
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  multi_az                            = true
  enabled_cloudwatch_logs_exports     = ["audit", "error", "general", "slowquery"]
}

# RDS Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow inbound traffic"
  vpc_id      = var.vpc_rds_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.rds_security_group
  }
}

resource "aws_db_parameter_group" "default" {
  name   = "${var.db_name}-parameters"
  family = var.db_parameter_family

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  parameter {
    name  = "require_ssl"
    value = "1"
  }
}

resource "aws_sns_topic" "rds_alarm_topic" {
  name = "rds-alarm-topic"
}

resource "aws_db_subnet_group" "default" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "rds-cpu-high-${var.rds_instance_identifier}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = var.rds_cpu_utilization_high_threshold

  dimensions = {
    DBInstanceIdentifier = aws_db_instance.default.id
  }

  alarm_description = "This alarm fires when RDS CPU utilization exceeds ${var.rds_cpu_utilization_high_threshold} percent"
  alarm_actions     = [aws_sns_topic.rds_alarm_topic.arn]
}