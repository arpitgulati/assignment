// The cluster name, e.g cdn
output "name" {
  value = "${var.name}"
}

output "autoscaling_group_id" {
  value = "${aws_autoscaling_group.main.id}"
}