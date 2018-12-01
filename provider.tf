provider "aws" {
  region = "${var.region}"
}

/*
state files are stored in s3
*/

terraform {
  backend "s3" {
    bucket = "javahome-6pm-state-dinesh"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
