terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
 backend "s3" {
    bucket = "statefileusingjenkins"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"
    encrypt=true
  }
}
provider "aws" {
  region = "ap-northeast-1"
}
