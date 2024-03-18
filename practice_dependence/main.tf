
resource "aws_s3_bucket" "dependence" {
    bucket = "vwuqgvygftykj"
    depends_on = [ aws_instance.dependence ]#this is mention for to 1st create the ec2 instance and then s3 bucket without this line the s3 bucket 1t created 
  
}
resource "aws_instance" "dependence" {
    ami = "ami-07bff6261f14c3a45"
    instance_type = "t2.micro"
    key_name = "vpc"
    tags = {
      Name = "dependence"
    }
  
}