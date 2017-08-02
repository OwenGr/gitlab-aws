# Environment
variable "environment" {
  description = "An environment name to prefix objects with. Typically your name for sandbox environments, or dev, qa, uat, prod, etc."
}

# AWS Provider variables

variable "aws_region" {
  description = "AWS EC2 Region"
  default     = "us-west-2"
}

# VPC variables

variable "vpc_id" {
  description = "The VPC ID to deploy GitLab to"
}

variable "public_subnets" {
  type        = "list"
  description = "The public subnets to deploy to"
}

variable "private_subnets" {
  type        = "list"
  description = "The private subnets to deploy to"
}

# EC2 Variables

variable "gitlab_instance_type" {
  description = "The EC2 instance type to deploy for the GitLab server"
  default     = "m4.large"
}

variable "runner_instance_type" {
  description = "The EC2 instance type to create for GitLab runners"
  default     = "m4.large"
}

variable "db_instance_type" {
  description = "The DB instance type to utilize"
  default     = "db.t2.small"
}

# RDS Variables
variable "db_username" {
  description = "The master database username"
  default     = "gitlab"
}

variable "db_password" {
  description = "The master database password"
}
