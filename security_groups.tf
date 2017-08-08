resource "aws_security_group" "gitlab" {
  name        = "${var.environment}-gitlab-web"
  description = "Allow traffic to the GitLab web servers"
  vpc_id      = "${data.aws_vpc.selected.id}"
}

resource "aws_security_group" "db_group" {
  name        = "${var.environment}-gitlab-db"
  description = "Allow traffic to the database"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = ["${aws_security_group.gitlab.id}"]
  }

  tags {
    Name        = "GitLab DB Security Group"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "cache" {
  name        = "${var.environment}-gitlab-cache"
  description = "Allow traffic to the Redis Cache"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress {
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = ["${aws_security_group.gitlab.id}"]
  }

  tags {
    Name        = "GitLab Cache Security Group"
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "nfs" {
  name        = "${var.environment}-gitlab"
  description = "Allow inbound traffic to NFS mount points"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = ["${aws_security_group.gitlab.id}"]
  }
}
