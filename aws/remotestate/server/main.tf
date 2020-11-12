data "terraform_remote_state" "infra" {
  backend = "s3"
  config = {
    bucket = "alacademyjenkins"
    key    = "stevevpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
