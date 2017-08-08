# Note that we should not use EFS long-term, as performance will tank once burst credits are expended.
resource "aws_efs_file_system" "gitlab" {
  creation_token = "${var.environment}-gitlab"

  tags {
    Name        = "${var.environment} GitLab EFS"
    Environment = "${var.environment}"
  }
}

resource "aws_efs_mount_target" "gitlab1" {
  file_system_id  = "${aws_efs_file_system.gitlab.id}"
  subnet_id       = "${var.private_subnets[0]}"
  security_groups = ["${aws_security_group.nfs.id}"]
  depends_on      = ["aws_efs_file_system.gitlab"]
}

resource "aws_efs_mount_target" "gitlab2" {
  file_system_id  = "${aws_efs_file_system.gitlab.id}"
  subnet_id       = "${var.private_subnets[1]}"
  security_groups = ["${aws_security_group.nfs.id}"]
  depends_on      = ["aws_efs_file_system.gitlab"]
}
