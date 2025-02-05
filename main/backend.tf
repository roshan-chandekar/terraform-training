terraform {
  backend "s3" {
    bucket         = "roshan-test-bucket-2025-01-22"
    key            = "terraform/state.tfstate"
    region         = "ap-south-1"
    encrypt        = true 
    dynamodb_table = "terraform-lock"
  }
}
