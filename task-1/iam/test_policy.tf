resource "aws_iam_policy" "test_policy" {
  name        = "test_policy"
  description = "Policy of EC2 write access to S3 bucket roshan-test-bucket-2025-01-22"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = [
          "arn:aws:s3:::roshan-test-bucket-2025-01-22",
          "arn:aws:s3:::roshan-test-bucket-2025-01-22/*"
        ]
      }
    ]
  })
}

