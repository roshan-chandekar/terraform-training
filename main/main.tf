provider "aws" {
  region = "ap-south-1" # Update to your desired region
}

module "test_bucket" {
  source      = "/home/ubuntu/terraform-training/task-1/modules/s3_bucket_module"
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


