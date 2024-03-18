resource "aws_s3_bucket" "name" {
    bucket = "my-test-bucket"
    tags = {
      Name = "name"
    }
  
}