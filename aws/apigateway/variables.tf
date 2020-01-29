variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "prefix" {
  type    = string
  default = "steve"
}

variable "tags" {
  default = {
    "Name"      = "SteveAPIGW"
    "Project"   = "ALAcademy2019"
    "Info"      = "Test API Gateway with API Key"
    "Owner"     = "Steve Shilling"
    "StartDate" = "20200129"
    "EndDate"   = "20200131"
  }
}
