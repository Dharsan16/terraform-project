terraform {
  backend "s3" {
    bucket = "terraformproject537124942936"
    key    = "jenkins/ec2.tfstate"
    region = "us-east-1"
  }
}
