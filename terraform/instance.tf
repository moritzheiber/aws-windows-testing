resource "aws_security_group" "windows" {
  name        = "windows_rdp"
  description = "Windows RDP"
}

resource "aws_security_group_rule" "rdp_ingress" {
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["${chomp(data.http.public_ip.body)}/32"]
  security_group_id = aws_security_group.windows.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.windows.id
}

resource "aws_instance" "windows" {
  ami                         = data.aws_ami.windows.id
  instance_type               = var.size
  key_name                    = aws_key_pair.windowskey.key_name
  get_password_data           = true
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.windows.id]
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "windowskey" {
  key_name   = "rdp_key"
  public_key = tls_private_key.private_key.public_key_openssh
}
