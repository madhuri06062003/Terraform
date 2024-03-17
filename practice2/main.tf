#create VPC
resource "aws_vpc" "dev" {
cidr_block = "10.0.0.0/16"
tags={
    Name = "dev"
}  
}
#create internet gateway and attach to vpc
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id #IG attach block to vpc
  
}

#create subnets
resource "aws_subnet" "dev" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.dev.id #subnet attach block yo vpc
  
}


#cretae Route tables & attach internet gateway to Rt

resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id #attache block ig to rt
     
  }
  
}
#subent associations
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.dev.id #rout table association rt attach
    subnet_id = aws_subnet.dev.id #rt association to subnet
  
}



  