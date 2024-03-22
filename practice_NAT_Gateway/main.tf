#create vpc
resource "aws_vpc" "practice3" {
    cidr_block = "10.0.0.0/16"
  
}
#create internet gateway
resource "aws_internet_gateway" "practice3" {
    vpc_id = aws_vpc.practice3.id
  
}
#create subnets
resource "aws_subnet" "practice3" {
    vpc_id = aws_vpc.practice3.id
    cidr_block = "10.0.0.0/23"
  
}
#create route tables
resource "aws_route_table" "practice3" {
    vpc_id = aws_vpc.practice3.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.practice3.id
    }

}
#create subnet association
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.practice3.id
    route_table_id = aws_route_table.practice3.id

  
}
#launch instance 
resource "aws_instance" "practice3" {
    ami = "ami-07bff6261f14c3a45"
    instance_type = "t2.micro"
    key_name = "vpc"
    tags = {
      Name = "practice3"
    }
  
}

#create private subnet
resource "aws_subnet" "private3" {
    vpc_id = aws_vpc.practice3.id
    cidr_block = "10.0.0.0/21"
  
}

#create NAT gateway
resource "aws_nat_gateway" "practice3" {
    subnet_id = aws_subnet.private3.id
    tags = {
      Name = "practice3"
    }
  
}

#create private route table
resource "aws_route_table" "private3" {
    vpc_id = aws_vpc.practice3.id
    route  {
        nat_gateway_id = aws_nat_gateway.practice3.id
        cidr_block = "0.0.0.0/0"
    }
  
}
#routing to private rt to private subnet
resource "aws_route_table_association" "private3" {
    route_table_id = aws_route_table.private3.id
    subnet_id = aws_subnet.private3.id
}
