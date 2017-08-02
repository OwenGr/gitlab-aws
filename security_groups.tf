resource "aws_security_group" "db_group" {
  name        = "${var.environment}-gitlab-db"
  description = "Allow traffic to the database"
  vpc_id      = "${data.aws_vpc.selected.id}"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_subnet.public_a.cidr_block}", "${data.aws_subnet.public_b.cidr_block}"]
  }

  tags {
    Name        = "GitLab DB Security Group"
    Environment = "${var.environment}"
  }
}
