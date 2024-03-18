data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}





data "aws_security_group" "datasource" {
    id = "sg-02005fca600d8e9e1"
  
}
data "aws_subnet" "datasource" {
    id = "subnet-0b6b7de4736d59241"
  
}