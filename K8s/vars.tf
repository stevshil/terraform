variable "profile" {
  type        = string
  default     = "academy2"
  description = "The AWS profile to use to run commands"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "ami" {
  type    = string
  default = "ami-06ce3edf0cff21f07"
}

variable "controller_type" {
  type    = string
  default = "t2.micro"
}

variable "kube_type" {
  type    = string
  default = "t3a.xlarge"
}

variable "sshkey" {
  type    = string
  default = "steveshillingacademyie"
}

variable "subnetid" {
  default = "subnet-7bddfc1d"
}

variable "sgids" {
  type    = list(string)
  default = ["sg-01f897dc42d10c7de"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-4bb64132"
}

variable "tags" {
  default = {
    Name    = "StevesTF"
    Project = "ALAcademy2020"
  }
}

variable "dnszone" {
  type    = string
  default = "Z07626429N74Z31VDFLI"
}

variable "prefix" {
  type    = string
  default = "steve"
}

variable "dnssuffix" {
  type    = string
  default = "academy.grads.al-labs.co.uk"
}

variable "sshkeyfile" {
  type    = string
  default = "/home/steve/.aws/automationlogic/steveshillingacademyie.pem"
}
