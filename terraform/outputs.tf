output "jenkins_public_ip" {
  description = "Public IP of Jenkins EC2"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_public_dns" {
  description = "Public DNS of Jenkins EC2"
  value       = aws_instance.jenkins.public_dns
}

output "jenkins_ssh_command" {
  description = "SSH command to connect Jenkins server"
  value       = "ssh -i ~/.ssh/trend-key.pem ubuntu@${aws_instance.jenkins.public_ip}"
}

output "vpc_id" {
  value = aws_vpc.trend_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "security_group_id" {
  value = aws_security_group.jenkins_sg.id
}
