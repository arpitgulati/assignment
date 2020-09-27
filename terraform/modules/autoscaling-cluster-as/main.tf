/**
 * Autoscaling cluster with the corresponding launch configs, cloudwatch alarms, autoscaling policies etc:
 *
 *
 * Usage:
 *
 *      module "app" {
 *        name                 = "fynd"
 *        environment          = "prod"
 *        codebase             = "orbis"
 *        server_type          = "as"
 *        subnet_id            = "1"
 *        key_name             = "ssh-key"
 *        vpc_security_group_ids = "1,2"
 *        region               = "us-west-2"
 *        instance_type        = "t2.small"
 *        instance_ebs_optimized = true
 *        desired_capacity     =   1
 *        ec2_associate_public_ip_address = true
 *        root_volume_size     = 25
 *        domain_name          = "growth"
 *        private_ip           = "192.168.10.12"
 *        ami_name_prefix      = "fynd-avis-app-server*"
 *        aws_account_id       = 123456789
 *
 *      }
 *
 */



variable "name" {
  description = "The cluster name, e.g cdn"
}

variable "environment" {
  description = "Environment tag, e.g prod"
}

//variable "subnet_ids" {
//  description = "List of subnet IDs"
//}

variable "key_name" {
  description = "SSH key name to use"
}

variable "instance_type" {
  description = "The instance type to use, e.g t2.small"
}

variable "instance_ebs_optimized" {
  description = "When set to true the instance will be launched with EBS optimized turned on"
  default     = true
}

variable "min_size" {
  description = "Minimum instance count"
  default     = 3
}

variable "max_size" {
  description = "Maxmimum instance count"
  default     = 100
}

variable "desired_capacity" {
  description = "Desired instance count"
  default     = 3
}

variable "associate_public_ip_address" {
  description = "Should created instances be publicly accessible (if the SG allows)"
  default = false
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  default     = 25
}

variable "domain_name" {
  description = "Name of the domain team to which this instance belongs"
  default     = "infra"
}

variable "ansible_staging_dir" {
  description = "Directory where ansible roles are to be copied and executed from"
}

variable "ansible_vault_password" {
  description = "Vault password to unlock ansible credentials stored in vault"
}

variable "ansible_base_repo_url" {
  description = "SSH url for the ansible-base repo"
}

variable "ansible_base_tags" {
  description = "Tags to be executed in the ansible-base repo playbook run"
}

# variable "repo_path" {
#   description = "Path of the repo on the server"
# }

# variable "ansible_service_tags" {
#   description = "Ansible tags to be fired for the ansible playbook of the service"
# }

# variable "ansible_service_playbook_dir" {
#   description = "Ansible service playbook path"
# }

# variable "ansible_service_playbook_name" {
#   description = "Ansible service playbook name"
# }

variable "codebase" {
  description = "Name of the codebase for the app server e.g. orbis, avis"
}

variable "ami_name_prefix" {
  description = "AMI Name prefix e.g. fynd-avis-app-server"
}

variable "server_type" {
  description = "Type of server"
  default = "as"
}

variable "security_group_ids" {
  description = "Security Groups to be mapped to Launch configuration"
}

# variable "ansible_environment" {
#   description = "Environment name to be passed to ansible"
# }

variable "aws_account_id" {
  description = "AWS Account ID"
}

variable "default_branch" {
  description = "Default branch of the service to be deployed on the env"
  default     = "master"
}

variable "ansible_service_inventory_dir" {
  description = "Name of the directory in the project where the inventory files are located"
  default = "inventory"
}

variable "ec2_instance_iam_profile_arn" {
  description = "ARN of the IAM profile to be attached to all EC2 Instances"
}

variable "autoscaling_cpu_high_threshold" {
  description = "Per application map of high cpu on which to trigger scale up policy"
}

variable "autoscaling_cpu_low_threshold" {
  description = "Per application map of low cpu on which to trigger scale down policy"
}

variable "autoscaling_cpu_high_threshold_evaluation_period" {
  description = "Evaluation period for CPU High policy"
}

variable "autoscaling_cpu_low_threshold_evaluation_period" {
  description = "Evaluation period for CPU Low policy"
}

variable "autoscaling_cpu_low_statistic" {
  description = "Statistic to be evaluated for Autoscaling CPU High Policy"
}

variable "autoscaling_cpu_high_statistic" {
  description = "Statistic to be evaluated for Autoscaling CPU Low Policy"
}

# variable "ansible_extra_vars" {
#   description = "Comma separated list of server roles"
# }

variable "vpc_id" {
  description = "VPC ID for the given environment"
}

variable "subnet_name" {
  description = "Name of the subnet in which the given ASG resides"
}

variable "subnet_prefix" {
  description = "Type of the subnet in which the given ASG resides"
  default = "public"
}

variable "health_check_type" {
  description = "Health check type EC2 or ELB. Use EC2 for celery workers vs ELB for application servers"
}

variable "health_check_grace_period" {
  description = "Health check grace period in secs"
  default = 300
}

variable "infra_aws_notifications_lambda_name" {
  description = "infra aws notifications lambda name"
  default = "infra-aws-notifications"
}

# variable "asg_lifecycle_hook_update_api_gatway_url" {
#   description = "ASG lifecycle hook to update state"
# }

variable "replace_pattern" {
  description = "replace pattern for environment"
  default = "/[_-]/g"
}

variable "replace_value" {
  description = "replace value for environment"
  default = ""
}

variable "instance_launch_lifecycle_hook_heartbeat_timeout" {
  description = "heartbeat timeout for launch lifecycle hook"
  default = 600
}

variable "ssm_parameter_path_prefix" {
  description = "Prefix for SSM Parameter Path"
  default = "deployment-config"
}

variable "ec2_instance_iam_profile_name" {
  description = "Name of the EC2 instance role to be attached to the ASG instance"
  default = "ec2-instance-role"
}

variable "custom_ec2_ssm_paramter_private_dns_zookeeper" {
  description = "EC2 instance private dns value of zookeeper"
  default = ""
}
variable "custom_ec2_ssm_paramter_private_dns_schema_registry" {
  description = "EC2 instance private dns value of schema registry"
  default = ""
}
variable "custom_ec2_ssm_paramter_private_dns_kafka" {
  description = "EC2 instance private dns value of kafka"
  default = ""
}

variable "scale_up_cooldown_period" {
  description = "The number of seconds after scaling activity completes before another can begin"
  default = 240
}

variable "scale_down_cooldown_period" {
  description = "The number of seconds after scaling activity completes before another can begin."
  default = 300
}

data "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.ec2_instance_iam_profile_name}"
}

data "template_file" app_server_user_data {

  template = "${file("${path.module}/files/app_server_user_data.sh.tpl")}"

  vars {
    ansible_staging_dir           = "${var.ansible_staging_dir}"
    domain_name                   = "${var.domain_name}"
    ansible_vault_password        = "${var.ansible_vault_password}"
    host_name                     = "${var.name}-${var.domain_name}-${var.codebase}-${var.server_type}-${var.environment}-{}-{}"
    ansible_base_repo_url         = "${var.ansible_base_repo_url}"
    ansible_base_tags             = "${var.ansible_base_tags}"
    # repo_path                     = "${var.repo_path}"
    codebase                      = "${var.codebase}"
    # default_branch                = "${var.default_branch}"
    # # ansible_service_inventory_dir = "${var.ansible_service_inventory_dir}"
    # # ansible_service_tags          = "${var.ansible_service_tags}"
    # # ansible_service_playbook_dir  = "${var.ansible_service_playbook_dir}"
    # # ansible_service_playbook_name = "${var.ansible_service_playbook_name}"
    # ansible_environment           = "${var.ansible_environment}"
    # ansible_extra_vars            = "${var.ansible_extra_vars}"
    # infra_aws_notifications_lambda_name       = "${var.infra_aws_notifications_lambda_name}-${replace(var.environment, var.replace_pattern, var.replace_value)}-ASGInfraNotification"
    # asg_lifecycle_hook_update_api_gatway_url  = "${var.asg_lifecycle_hook_update_api_gatway_url}"
  }
}

data "aws_ami" app_server_ami {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_name_prefix}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["${var.aws_account_id}"]
}

data "aws_subnet_ids" "app_server_subnet_ids" {
  vpc_id = "${var.vpc_id}"

  tags {
    Name        = "${var.subnet_prefix}-${var.subnet_name}"
    Environment = "${var.environment}"
    # Terraform   = "true"
  }
}

resource "aws_launch_configuration" "main" {
  name_prefix = "${format("%s-%s-%s", var.name, var.codebase, var.server_type)}"

  image_id                    = "${data.aws_ami.app_server_ami.id}"
  instance_type               = "${var.instance_type}"
  ebs_optimized               = "${var.instance_ebs_optimized}"
  key_name                    = "${var.key_name}"
  user_data                   = "${data.template_file.app_server_user_data.rendered}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  security_groups             = ["${split(",",var.security_group_ids)}"]
  iam_instance_profile        = "${data.aws_iam_instance_profile.ec2_instance_profile.arn}"

  # root
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.root_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "main" {
  name = "${var.name}-${var.codebase}-${var.server_type}"

  vpc_zone_identifier       = ["${data.aws_subnet_ids.app_server_subnet_ids.ids}"]
  launch_configuration      = "${aws_launch_configuration.main.id}"
  min_size                  = "${var.min_size}"
  max_size                  = "${var.max_size}"
  desired_capacity          = "${var.desired_capacity}"
  health_check_type         = "${var.health_check_type}"
  health_check_grace_period = "${var.health_check_grace_period}"
  termination_policies      = ["OldestLaunchConfiguration", "Default"]
  wait_for_capacity_timeout = "5m"
  enabled_metrics           = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances",
    "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]

  tag {
    key                 = "Name"
    value               = "${var.name}-${var.domain_name}-${var.codebase}-${var.server_type}-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Cluster"
    value               = "${var.codebase}-${var.server_type}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Domain"
    value               = "${var.domain_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Service"
    value               = "${var.codebase}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [ "desired_capacity", "max_size", "min_size" ]
  }
}

resource "aws_ssm_parameter" "environment" {
  name = "/${var.ssm_parameter_path_prefix}/${var.environment}/${var.codebase}/${var.server_type}/environment"
  type = "String"
  value = "${var.environment}"
  overwrite = true
}

resource "aws_ssm_parameter" "service" {
  name  = "/${var.ssm_parameter_path_prefix}/${var.environment}/${var.codebase}/${var.server_type}/service"
  type  = "String"
  value = "${var.codebase}"
  overwrite = true
}

resource "aws_ssm_parameter" "domain" {
  name  = "/${var.ssm_parameter_path_prefix}/${var.environment}/${var.codebase}/${var.server_type}/domain"
  type  = "String"
  value = "${var.domain_name}"
  overwrite = true
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.name}-${var.codebase}-${var.server_type}-scaleup"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "${var.scale_up_cooldown_period}"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.name}-${var.codebase}-${var.server_type}-scaledown"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = "${var.scale_down_cooldown_period}"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"

  lifecycle {
    create_before_destroy = true
  }
}
# https://www.terraform.io/docs/providers/aws/r/cloudwatch_metric_alarm.html
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "${var.name}-${var.codebase}-${var.server_type}-cpuutilization-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "${var.autoscaling_cpu_high_threshold_evaluation_period}"
  statistic           = "${var.autoscaling_cpu_high_statistic}"
  threshold           = "${var.autoscaling_cpu_high_threshold}"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }

  alarm_description = "Scale up if the cpu utilization is above 70% for 10 minutes"
  alarm_actions     = ["${aws_autoscaling_policy.scale_up.arn}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_metric_alarm" "system_status_check_failed" {
  alarm_name          = "${var.name}-${var.codebase}-${var.server_type}-systemstatuscheck-failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }

  alarm_description = "Scale up if the system status check failed for 1 minute"
  alarm_actions     = ["${aws_autoscaling_policy.scale_up.arn}"]

  lifecycle {
    create_before_destroy = true
  }

  # This is required to make cloudwatch alarms creation sequential, AWS doesn't
  # support modifying alarms concurrently.
  depends_on = ["aws_cloudwatch_metric_alarm.cpu_high"]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "${var.name}-${var.codebase}-${var.server_type}-cpuutilization-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "${var.autoscaling_cpu_low_threshold_evaluation_period}"
  statistic           = "${var.autoscaling_cpu_low_statistic}"
  threshold           = "${var.autoscaling_cpu_low_threshold}"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }

  alarm_description = "Scale down if the cpu reservation is below 10% for 10 minutes"
  alarm_actions     = ["${aws_autoscaling_policy.scale_down.arn}"]

  lifecycle {
    create_before_destroy = true
  }

  # This is required to make cloudwatch alarms creation sequential, AWS doesn't
  # support modifying alarms concurrently.
  depends_on = ["aws_cloudwatch_metric_alarm.system_status_check_failed"]
}

resource "aws_cloudwatch_metric_alarm" "instance_status_check_failed" {
  alarm_name          = "${var.name}-${var.codebase}-${var.server_type}-instancestatuscheck-failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "StatusCheckFailed_Instance"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Maximum"
  threshold           = "1"

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.main.name}"
  }

  alarm_description = "Scale up if the instance status check failed for 1 minute"
  alarm_actions     = ["${aws_autoscaling_policy.scale_up.arn}"]

  lifecycle {
    create_before_destroy = true
  }

  # This is required to make cloudwatch alarms creation sequential, AWS doesn't
  # support modifying alarms concurrently.
  depends_on = ["aws_cloudwatch_metric_alarm.cpu_low"]
}

resource "aws_autoscaling_lifecycle_hook" "instance_teminating_lifecycle_hook" {
  name                   = "${var.name}-${var.codebase}-${var.server_type}-instance-terminating-lifecycle-hook"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"
  default_result         = "CONTINUE"
  heartbeat_timeout      = 2000
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"
}

resource "aws_autoscaling_lifecycle_hook" "instance_launch_lifecycle_hook" {
  name                   = "${var.name}-${var.codebase}-${var.server_type}-instance-launch-lifecycle-hook"
  autoscaling_group_name = "${aws_autoscaling_group.main.name}"
  default_result         = "ABANDON"
  heartbeat_timeout      = "${var.instance_launch_lifecycle_hook_heartbeat_timeout}"
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_LAUNCHING"
}
