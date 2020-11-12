variable "projectname" {
  type    = string
  default = "SteveTF"
}

variable "env" {
  type = string
}

variable "tagname" {
  type    = string
  default = "Demo"
}

variable "tags" {
  default = {
    Start_date  = "2020-11-10"
    Environment = "dev"
  }
}

variable "image_id" {
  type = map
  default = {
    eu-west-1 = "ami-0bb3fad3c0286ebd5"
    us-east-1 = "ami-0947d2ba12ee1ff75"
  }
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "keyname" {
  type = string
}
