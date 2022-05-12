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
# Windows Server 2022
# - Windows_Server-2022-English-Full-Base*

data "aws_ami" "windows" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
}
