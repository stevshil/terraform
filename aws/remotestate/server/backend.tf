terraform {
  backend "s3" {
    bucket = "alacademyjenkins"
    key    = "steveserver/terraform.tfstate"
    region = "eu-west-1"
  }
}
