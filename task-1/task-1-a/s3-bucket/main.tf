provider "aws" {
  region = "ap-south-1" # Update to your desired region
}

module "test_bucket" {
  source      = "./s3_bucket_module"
  bucket_name = "roshan-test-bucket-2025-01-22"
  versioning  = true
  tags = {
    Environment = "Dev"
    Team        = "DevOps"
    Name = "test_bucket"
  }
}

