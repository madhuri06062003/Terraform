resource "aws_instance" "practice1" {
    ami = "ami-07bff6261f14c3a45"
    instance_type = "t2.micro"
    key_name = "vpc"
    tags = {
      Name = "practice1"
    }
  
}