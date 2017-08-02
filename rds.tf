resource "aws_db_subnet_group" "gitlab" {
  description = "db subnet group for gitlab rds instance"
  name_prefix = "${var.environment}-gitlab-"
  subnet_ids  = "${var.private_subnets}"

  tags {
    Name        = "GitLab DB Subnet Group"
    Environment = "${var.environment}"
  }
}

resource "aws_db_instance" "gitlab" {
  allocated_storage          = 20
  storage_type               = "gp2"
  engine                     = "postgres"
  engine_version             = "9.6.3"
  instance_class             = "${var.db_instance_type}"
  identifier                 = "${var.environment}-gitlab"
  name                       = "gitlab"
  username                   = "${var.db_username}"
  password                   = "${var.db_password}"
  db_subnet_group_name       = "${aws_db_subnet_group.gitlab.id}"
  parameter_group_name       = "default.postgres9.6"
  multi_az                   = "true"
  license_model              = "postgresql-license"
  auto_minor_version_upgrade = "true"
  vpc_security_group_ids     = ["${aws_security_group.db_group.id}"]
  port                       = "5432"
  final_snapshot_identifier  = "${var.environment}-gitlab-db"

  tags {
    Name        = "Gitlab DB Instance"
    Environment = "${var.environment}"
  }
}
