terraform {
  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = "1.172.0"  # Specify the version you wish to use
    }
  }
#  backend "s3" {
#    bucket = "dpe-terraform-bucket"
#    key    = "."
#    region = "us-east-1"
#  }
}