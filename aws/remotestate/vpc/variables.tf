variable "projectname" {
  type    = string
  default = "SteveTF"
}

variable "env" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "172.32.0.0/16"
}

variable "tags" {
  default = {
    Start_date  = "2020-11-10"
    Environment = "dev"
  }
}

variable "homeip" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "pubsubs" {
  type    = list
  default = ["172.32.1.0/24", "172.32.2.0/24"]
}
