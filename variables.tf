variable "aws_region" {
    description = "AWS EC2 Region"
    default = "us-west-2"
}

variable "vpc_id" {
    description = "The VPC ID to deploy GitLab to"
}

variable "aws_ec2_gitlab_type" {
    description = "The EC2 instance type to deploy for the GitLab server"
    default = "m4.large"
}

variable "aws_ec2_runner_type" {
    description = "The EC2 instance type to create for GitLab runners"
    default = "m4.large"
}