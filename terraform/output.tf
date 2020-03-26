output "windows_password" {
  description = "Returns the decrypted AWS generated windows password"
  value       = rsadecrypt(aws_instance.windows.password_data, tls_private_key.private_key.private_key_pem)

}

output "public_ip" {
  description = "The public IP to connect to"
  value       = aws_instance.windows.public_ip
}
