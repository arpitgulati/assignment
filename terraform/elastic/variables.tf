variable "name" {
  description = "the name of your stack, e.g. \"fynd\""
  default = "assignment"
}

variable "aws_profile" {
  description = "Name of the AWS profile to be used for the current terraform run"
  default = "default"
}
variable "environment" {
  description = "the name of your environment, e.g. \"prod-west\""
}
variable "key_name" {
  description = "the name of the ssh key to use, e.g. \"internal-key\""
}

variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
}

variable "cidr" {
  description = "the CIDR block to provision for the VPC, if set to something other than the default, both internal_subnets and public_subnets have to be defined as well"
}


variable "ec2_instance_ebs_optimized" {
  description = "use EBS - not all instance types support EBS"
  type    = "string"
}

variable "ec2_instance_associate_public_ip" {
  description = "Map public IP to EC2 instances"
  type    = "string"
}

variable "aws_amis" {
  description = "Map of AWS AMIs"
  type = "map"
}

variable "instance_types" {
  description = "Map of Instance types"
  type = "map"
}

# variable "private_ips" {
#   description = "Map of Private IPs"
#   type = "map"
# }

variable "root_volume_sizes" {
  description = "Map of root volume sizes"
  type = "map"
}

# variable "root_volume_types" {
#   description = "Map of root volume types, like gp2/io1"
#   type = "map"
# }

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

# variable "s3_bucket_prefix" {
#   description = "S3 Bucket Prefix"
#   type = "string"
# }
# variable "repo_path_map" {
#   description = "Path of the repo on the app server"
#   type = "map"
# }
# variable "playbook_path_map" {
#   description = "Map of playbook paths"
#   type = "map"
# }
# variable "playbook_name_map" {
#   description = "Map of playbook names"
#   type = "map"
# }
# variable "health_check_url_map" {
#   description = "Map of healtcheck urls"
#   type = "map"
# }
# variable "ansible_environment_map" {
#   description = "Map of ansible environments"
#   type = "map"
# }
# variable "host_header_map" {
#   description = "Map of host headers"
#   type = "map"
# }

# variable "host_header_map_v2" {
#   description = "Map of host headers"
#   type = "map"
# }

# variable "path_route_map" {
#   description = "Map of path routes"
#   type = "map"
# }

# variable "ansible_environment" {
#   description = "Ansible environment"
# }

variable "aws_account_id" {
  description = "AWS Account ID"
  type = "string"
}

# variable "ssl_certificate_domain" {
#   description = "SSL Certificate domain"
#   type        = "string"
# }

variable "ec2_instance_iam_profile_arn" {
  description = "ARN of the IAM role to be attached to all EC2 Instances"
}

variable "ec2_instance_iam_profile_name" {
  description = "Name of the IAM role to be attached to all EC2 Instances"
}

variable "elasticsearch_autoscaling_group_params" {
  description = "Elasticsearch Auto Scaling Group Params"
  type        = "map"
}

variable "logstash_autoscaling_group_params" {
  description = "logstash Auto Scaling Group Params"
  type        = "map"
}

# variable "slack_alerts_url" {
#   description = "Webhook URL for slack alerts"
# }



variable "vpc_id" {
  description = "VPC ID"
  type        = "string"
}




