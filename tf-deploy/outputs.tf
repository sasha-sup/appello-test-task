output "public_ip" {
  value       = aws_instance.appello_test.public_ip
  description = "public ip address of the appello test server"
}

