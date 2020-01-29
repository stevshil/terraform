# https://www.terraform.io/docs/providers/aws/r/lambda_function.html

resource "aws_lambda_function" "main" {
  function_name = "${var.prefix}APITest"

  filename = "files/main.zip"
  handler  = "main.lambda_handler"
  runtime  = "python3.7"

  role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      foo = "bar"
    }
  }
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = "${var.prefix}_lambda_exec"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF

}
