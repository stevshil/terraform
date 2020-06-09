output "controller_ip" {
	value = aws_instance.controller.public_ip
}

output "controller_dns" {
  value = aws_route53_record.controller.name
}
