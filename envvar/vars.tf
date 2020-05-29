variable "aws_profile" {
  type        = string
  default     = "academy2"
  description = "The AWS profile to use to run commands"
}

variable "aws_region" {
  type    = string
  default = "eu-west-1"
}
