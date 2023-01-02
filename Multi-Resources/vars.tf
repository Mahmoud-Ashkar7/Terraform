variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-2b"
}
variable "ZONE3" {
  default = "us-east-2c"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0b5eea76982371e91"
    us-east-2 = "ami-0a606d8395a538502"
  }
}
variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "dovekey.pub"
}

variable "PRIV_KEY" {
  default = "dovekey"
}
variable "MYIP" {
  default = "183.83.39.203/32"

}