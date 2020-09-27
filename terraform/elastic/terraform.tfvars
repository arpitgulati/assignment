environment = "pre-production"
aws_account_id = "214511998446"
terraform_s3_bucket = "testing-elasticsearch-terraform-state"
region = "ap-south-1"
key_name = "elastic-pre-production"
vpc_id = "vpc-7098781b"
cidr = "172.31.0.0/16"

ec2_instance_ebs_optimized = "false"
ec2_instance_associate_public_ip = "true"
aws_amis = {
  "ubuntu-trusty" = "",
  "jio-base" = "ami-01d4246a3b22988b8"
  "bastion-host" = "ami-01d4246a3b22988b8"
  "fynd-data-platform" = "ami-218cb94e"
  "fynd-base-data-platform-app-servers" = "ami-078931c5f2713b4ca"
  "logstash-server"  = "ami-06e5abc66b514bb71"
}

root_volume_sizes = {
  elasticsearch-server = 60
  logstash-server      = 30
}

ec2_instance_iam_profile_arn = "arn:aws:iam::214511998446:role/ec2-instance-role"
ec2_instance_iam_profile_name = "ec2-instance-role"

instance_types = {
  elasticsearch-server   =  "m5a.large"
  logstash-server  =  "m5.xlarge"
}

elasticsearch_autoscaling_group_params = {
  min-size           = 3
  desired-size       = 3
  max-size           = 3
  cpu-high-threshold = 70
  cpu-low-threshold  = 10
  cpu-high-threshold-evaluation-period = 300
  cpu-low-threshold-evaluation-period = 300
  cpu-high-statistic = "Average"
  cpu-low-statistic  = "Average"
  health-check-type  = "EC2"
}

logstash_autoscaling_group_params = {
  min-size           = 1
  desired-size       = 1
  max-size           = 3
  cpu-high-threshold = 70
  cpu-low-threshold  = 10
  cpu-high-threshold-evaluation-period = 300
  cpu-low-threshold-evaluation-period = 300
  cpu-high-statistic = "Average"
  cpu-low-statistic  = "Average"
  health-check-type  = "EC2"
}

ansible_staging_dir="/home/ubuntu"
ansible_vault_password="captureretail"
ansible_base_repo_url="https://github.com/arpitgulati/base-infra.git"
ansible_base_tags="hostname"

