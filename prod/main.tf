terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=3.54.0"
    local = ">=2.1.0"
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "$(var.access_key)"
  secret_key                  = "$(var.secret_key)"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  endpoints {
    s3 = "http://localhost:4566"
  }
  default_tags {
    tags = {
      Environment = "Development"
      Owner       = "Ops"
      Product     = "E-Commerce"
    }
  }
}

module "s3" {
  source   = "./modules/s3"
}