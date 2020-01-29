output "base_url" {
  value = aws_api_gateway_deployment.main.invoke_url
}

output "apikey" {
  value = aws_api_gateway_api_key.main.value
}

output "endpoint" {
  value = aws_lambda_function.main.function_name
}
