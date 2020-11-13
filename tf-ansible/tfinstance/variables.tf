variable "projectname" {
  type    = string
  default = "SteveTF"
}

variable "env" {
  type = string
}

variable "pemfile" {
  type = string
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

variable "keyname" {
  type = string
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "subnet_id" {
  type    = string
  default = "subnet-a94474e1"
}

variable "image_id" {
  type = map
  default = {
    eu-west-1 = "ami-0bb3fad3c0286ebd5"
    us-east-1 = "ami-0947d2ba12ee1ff75"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sec_grp_id" {
  type    = string
  default = "sg-01f897dc42d10c7de"
}
