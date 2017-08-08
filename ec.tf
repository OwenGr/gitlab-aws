resource "aws_elasticache_subnet_group" "gitlab" {
  name        = "${var.environment}-gitlab"
  description = "${var.environment}-gitlab ElastiCache"
  subnet_ids  = "${var.private_subnets}"
}

resource "aws_elasticache_cluster" "gitlab" {
  cluster_id           = "${var.environment}-gitlab"
  engine               = "redis"
  engine_version       = "3.2.4"
  node_type            = "${var.cache_instance_type}"
  port                 = "6379"
  parameter_group_name = "default.redis3.2"
  num_cache_nodes      = 1
  subnet_group_name    = "${aws_elasticache_subnet_group.gitlab.name}"
  security_group_ids   = ["${aws_security_group.cache.id}"]

  tags {
    Name        = "${var.environment}-gitlab-elasticache"
    Environment = "${var.environment}"
  }
}
