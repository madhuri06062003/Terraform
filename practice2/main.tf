#lauch vpc
resource "aws_vpc" "practice2" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "practice2"
    }
  
}
#launch internet gatway
resource "aws_internet_gateway" "practice2" {
    vpc_id = aws_vpc.practice2.id
  
}
#launch subnet
resource "aws_subnet" "practice2" {
    vpc_id = aws_vpc.practice2.id
    cidr_block = "10.0.0.0/21"
  
}
#launch rote tables
resource "aws_route_table" "practice2" {
  vpc_id = aws_vpc.practice2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.practice2.id
  }
}
#launch subnet association
resource "aws_route_table_association" "practice2" {
    subnet_id = aws_subnet.practice2.id
    route_table_id = aws_route_table.practice2.id

}
#launch ec2
resource "aws_instance" "practice2" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "practice2"
    }
  
}