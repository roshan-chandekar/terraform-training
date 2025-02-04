provider "aws" {
  region = "ap-south-1" # Update to your desired region
}

module "test_bucket" {
  source      = "/home/ubuntu/terraform-training/modules/s3_bucket_module"
  bucket_name = "roshan-test-bucket-2025-01-22"
  versioning  = true
  tags = {
    Environment = "Dev"
    Team        = "DevOps"
    Name = "test_bucket"
  }
}

resource "aws_vpc" "my_manual_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_public_subnet_1" {
  vpc_id            = aws_vpc.my_manual_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

module "iam" {
  source = "/home/ubuntu/terraform-training/modules/iam"
}

module "test_sg_1" {
  source  = "../modules/security_group"  # Path to the module
  sg_name = "test_sg_1"
  vpc_id  = "vpc-0d3e9a5f8c47f089d"
}

module "elb" {
  source          = "../modules/elb"
  elb_name        = "test_elb"
  security_groups = ["sg-0123456789abcdef0"]
  subnet_ids      = ["subnet-0a1b2c3d4e5f6g7h", "subnet-1a2b3c4d5e6f7g8h"]
  vpc_id          = "vpc-12345678"
  instance_ids    = ["i-0a1b2c3d4e5f6g7h"]
}

