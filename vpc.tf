# Use existing VPC information
data "aws_vpc" "selected" {
    id = "${var.vpc_id}"
}