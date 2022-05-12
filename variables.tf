variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "size" {
  type    = string
  default = "t3a.large"
}

variable "storage_size" {
  type    = string
  default = "50"
}

variable "additional_ips" {
  type    = list(string)
  default = []
}
