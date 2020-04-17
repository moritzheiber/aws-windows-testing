provider "aws" {
  version = "~> 2.54"
}

provider "http" {
  version = "~> 1.2.0"
}

provider "tls" {
  version = "~> 2.1"
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

data "http" "public_ip" {
  url = "http://ipv4.icanhazip.com"
}

# Available versions are:
# Windows Server 2016
# - Windows_Server-2016-English-Full-Base*
# Windows Server 2019
# - Windows_Server-2019-English-Core-Base*
# - Windows_Server-2019-English-Core-ContainersLatest*
# - Windows_Server-2019-English-Full-Base*

data "aws_ami" "windows" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2016-English-Full-Base*"]
  }
}
