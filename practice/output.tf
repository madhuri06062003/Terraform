output "public" {
    value = aws_instance.practice4.public_ip
    sensitive = true
}
output "private" {
    value = aws_instance.practice4.private_ip
  
}