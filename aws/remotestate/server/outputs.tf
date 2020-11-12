output "web_pub_dns" {
  value = aws_instance.web1.public_dns
}

output "instance_id" {
  value = aws_instance.web1.id
}
