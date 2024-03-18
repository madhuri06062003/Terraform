resource "aws_instance" "datasource" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "vpc"
    tags = {
      Name = "datasource"
    }
  
}