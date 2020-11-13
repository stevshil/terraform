terraform {
  backend "s3" {
    bucket = "alacademyjenkins"
    key    = "stevevpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
