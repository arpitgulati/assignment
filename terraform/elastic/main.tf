provider "aws" {
    version = "2.0.0"
    region = "${var.region}"
    profile = "${var.aws_profile}"
}

terraform {
  backend "s3" {
    bucket = ""
    key    = "lab/terraform.tfstate"
    region = ""
  }
}

# module "defaults" {
#   source = "../modules/defaults"
#   region = "${var.region}"
# }
