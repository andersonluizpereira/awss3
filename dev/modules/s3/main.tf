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