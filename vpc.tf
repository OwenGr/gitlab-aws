# Use existing VPC information
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet" "public_a" {
  id = "${var.public_subnets[0]}"
}

data "aws_subnet" "public_b" {
  id = "${var.public_subnets[1]}"
}

data "aws_subnet" "private_a" {
  id = "${var.private_subnets[0]}"
}

data "aws_subnet" "private_b" {
  id = "${var.private_subnets[1]}"
}
