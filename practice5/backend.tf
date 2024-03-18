terraform {
  backend "s3" {
    bucket = "statefile-4"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
