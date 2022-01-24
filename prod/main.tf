terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
    local = ">=2.1.0"
  }
}

provider "aws" {
  region                      = "us-east-1"
  default_tags {
    tags = {
      Environment = "Production"
      Owner       = "Ops"
      Product     = "E-Commerce"
    }
  }
}

module "s3" {
  source   = "./modules/s3"
}