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
}

# Create Bucket
resource "aws_s3_bucket" "b" {
  bucket = "mybucket"
  acl    = "public-read"
}

# Upload an object
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "test.txt"
  acl    = "public-read"
  source = "test.txt"
}