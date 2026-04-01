provider "aws" {
  region = "us-east-1"
}

# ---------------------------
# EC2 INSTANCE
# ---------------------------
resource "aws_instance" "E2-EBS" {
  ami           = "ami-0c3389a4fa5bddaad"
  instance_type = "t2.micro"
  key_name      = "test"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y

              # Install nginx
              yum install nginx -y
              systemctl start nginx
              systemctl enable nginx

              # Wait for EBS volume attachment
              sleep 60

              # Format EBS volume
              mkfs -t ext4 /dev/xvdf

              # Create mount directory
              mkdir /data

              # Mount volume
              mount /dev/xvdf /data

              # Persist mount after reboot
              echo "/dev/xvdf /data ext4 defaults,nofail 0 2" >> /etc/fstab
              EOF

  tags = {
    Name = "Jenkins-Terraform-EC2-EBS"
  }
}
