resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.dev.id
 
    tags = {
      Name = "dev_ec2"
    }
}
