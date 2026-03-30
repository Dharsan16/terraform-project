resource "aws_instance" "terraform-ec2-instance" {
  ami           = "ami-0c3389a4fa5bddaad"   # Amazon Linux (us-east-1)
  instance_type = "t2.micro"
  key_name      = "test"

  tags = {
    Name = "Jenkins-Terraform-EC2"
  }
}
