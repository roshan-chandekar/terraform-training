resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "test_policy" {
  name        = "test_policy"
  description = "Policy to give EC2 write access to S3 bucket roshan-test-bucket-2025-01-22"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetBucketLocation",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::roshan-test-bucket-2025-01-22",
          "arn:aws:s3:::roshan-test-bucket-2025-01-22/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test_role_policy_attachment" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.test_policy.arn
}

