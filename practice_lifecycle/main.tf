resource "aws_instance" "lifecycle" {
    ami = "ami-07bff6261f14c3a45"
    instance_type = "t2.micro"
    key_name = "vpc"
    availability_zone = "us-west-2b"
    tags = {
      Name = "lifecycle"
    }
  #lifecycle {
   #prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
 #}
 #lifecycle {
    #ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
  #}

  lifecycle {
    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
  }



}