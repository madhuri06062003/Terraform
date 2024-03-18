variable "ami_id" {
    description = "ami_id"
    type = string
    default = "ami-07bff6261f14c3a45"

}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "vpc"
  
}