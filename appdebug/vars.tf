variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "image_id" {
  type    = string
  default = "ami-0ea3405d2d2522162"
}

variable "profile" {
  type    = string
  default = "academy2"
}

variable "sshkey" {
  type    = string
  default = "steveshillingacademyie"
}

variable "sgs" {
  type    = list(string)
  default = ["sg-01f897dc42d10c7de"]
}

variable "tags" {
  default = {
    Name    = "SteveDocker"
    Project = "ALAcademy2020"
  }
}

variable "subnets" {
  type    = string
  default = "subnet-7bddfc1d"
}
