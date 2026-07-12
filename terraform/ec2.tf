# ------------------------
# Get Latest Ubuntu 24.04 LTS AMI
# ------------------------

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ------------------------
# Jenkins EC2 Instance
# ------------------------

resource "aws_instance" "jenkins" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  associate_public_ip_address = true

  user_data = file("${path.module}/userdata.sh")

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "trend-jenkins"
  }
}
