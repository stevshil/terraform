variable "dbuser" {
  type    = string
  default = "steve"
}

variable "dbpassword" {
  type    = string
  default = "secret123"
}

variable "dbsize" {
  type    = string
  default = "db.t2.micro"
}

variable "engine" {
  type    = string
  default = "mariadb"
}

variable "engine_version" {
  type    = string
  default = "10.2.12"
}

variable "storage" {
  type    = number
  default = 5
}

variable "dbname" {
  type    = string
  default = "stevedb"
}

variable "secgrps" {
  type    = list(string)
  default = ["sg-01f897dc42d10c7de"]
}

variable "monrole" {
  type    = string
  default = null
}

variable "monint" {
  type    = string
  default = 30
}

variable "monitoring_role_arn" {
  type    = string
  default = null
}

variable "monitor_role" {
  type    = bool
  default = false
}

variable "user_tags" {
  default = {
    Name    = "SteveDB"
    Owner   = "Steve Shilling"
    Project = "ALAcademy"
  }
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-7bddfc1d", "subnet-953a58cf", "subnet-a94474e1"]
}

variable "maj_eng_ver" {
  type    = string
  default = 10.2
}

variable "protect" {
  type    = bool
  default = false
}

variable "snapshotid" {
  type    = string
  default = null
}
