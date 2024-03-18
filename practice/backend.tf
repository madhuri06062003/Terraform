terraform {
  backend "s3" {
    bucket = "cfrdujgtchj"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}