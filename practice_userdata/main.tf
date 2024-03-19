provider "aws" {
    region = "ap-northeast-3"
  
}

resource "aws_instance" "userdata" {
  ami                    = "ami-070df91a479c25360"      #change ami id for different region
  instance_type          = "t2.micro"
  key_name               = "vpc"             #change key name as per your setup
  user_data              = file("install.sh") # define your path and file name 
     
  tags = {
    Name = "userdata"
  }
}